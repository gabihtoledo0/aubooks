import 'package:audio_service/audio_service.dart';
import 'package:aubooks/resources/models/models.dart';
import 'package:aubooks/resources/player_res.dart';
import 'package:aubooks/resources/repository.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:aubooks/widgets/player_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:flutter_downloader/flutter_downloader.dart';

class DetailPage extends StatefulWidget {
  final Book book;
  DetailPage(this.book);

  @override
  DetailPageState createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  var taskId;
  String? url;
  String? title;
  bool? toplay;
  late StreamSubscription<PlaybackState> playbackStateListner;

  /* _downloadBook() async{
    var path = await getApplicationDocumentsDirectory();
    taskId = await FlutterDownloader.enqueue(
      url: widget.book.id,
      savedDir: path.path,
      showNotification: true, // show download progress in status bar (for Android)
      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    );
    await FlutterDownloader.loadTasks();
  } */

  @override
  void initState() {
    super.initState();
    toplay = false;
    playbackStateListner = AudioService.playbackStateStream.listen((state) {
      if (state.processingState == AudioProcessingState.stopped) if (toplay!) {
        start();
        if (mounted) toplay = false;
      }
    });

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        toplay = state == AudioPlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    playbackStateListner.cancel();
    super.dispose();
  }

  Future<List<AudioFile>> _getRssFeeds() {
    return Repository().fetchAudioFiles(widget.book.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
        backgroundColor: const Color(0xFF9966DD),
      ),
      backgroundColor: Color(0xFF39403E),
      body: Stack(
        children: <Widget>[
          ListView(
            padding:
                EdgeInsets.fromLTRB(20.0, 20.0, 20.0, url != null ? 70 : 20),
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    child: Hero(
                      tag: "${widget.book.id}_image",
                      child: CachedNetworkImage(
                          imageUrl: widget.book.image, fit: BoxFit.cover),
                    ),
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          widget.book.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(widget.book.author,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Sansation',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF),
                            )),
                        const SizedBox(height: 18.0),
                        Text(
                            widget.book.totalTime == null
                                ? "Total time: indefinido"
                                : "Total time: ${widget.book.totalTime}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Sansation',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF),
                            )),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              const Text("Capítulos:",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Sansation',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF),
                  )),
              const SizedBox(height: 12),
              FutureBuilder(
                future: _getRssFeeds(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AudioFile>> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!
                          .map((item) => ListTile(
                                title: Text(item.title,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Sansation',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFFFFFFF),
                                    )),
                                leading: const Icon(
                                  Icons.play_circle_filled,
                                  color: Color(0xFFFFFFFF),
                                ),
                                onTap: () async {
                                  // if(url == item.url) AudioService.play();
                                  // SharedPreferences prefs = await SharedPreferences.getInstance();
                                  // await prefs.setString("play_url", item.url);
                                  // await prefs.setString("book_id", item.bookId);
                                  // await prefs.setInt("track", snapshot.data!.indexOf(item));

                                  setState(() {
                                    toplay = true;
                                    url = item.url;
                                    title = item.title;
                                  });

                                  start();
                                  await audioPlayer.play(url);
                                  AudioService.play();
                                },
                              ))
                          .toList(),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
          if (toplay == true) ...[
            Miniplayer(
              minHeight: 70,
              maxHeight: 400,
              builder: (height, percentage) {
                if (percentage > 0.2) {
                  return Scaffold(
                    backgroundColor: const Color(0xFF4E5752),
                    body: Padding(
                      padding: const EdgeInsets.all(20),
                      child: StreamBuilder(
                          stream: AudioService.playbackStateStream,
                          builder: (context, snapshot) {
                            PlaybackState? state =
                                snapshot.data as PlaybackState?;

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.book.image,
                                    fit: BoxFit.contain,
                                    height: 150,
                                    width: double.infinity,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  title!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 6),
                                if (state?.processingState ==
                                    AudioProcessingState.connecting) ...[
                                  const CircularProgressIndicator(
                                      color: Color(0xFF000000))
                                ] else ...[
                                  Slider(
                                    min: 0,
                                    max: duration.inSeconds.toDouble(),
                                    value: position.inSeconds.toDouble(),
                                    activeColor: const Color(0xFF9966DD),
                                    inactiveColor: const Color(0x8BFFFFFF),
                                    onChanged: (value) async {
                                      final position =
                                          Duration(minutes: value.toInt());
                                      await audioPlayer.seek(position);
                                      await audioPlayer.resume();
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(position.toString()),
                                        Text((duration - position).toString()),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 20)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            const Color(0xFF9966DD),
                                        child: IconButton(
                                          icon: Icon(
                                            toplay == true
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          iconSize: 20,
                                          onPressed: () async {
                                            if (toplay == true) {
                                              await audioPlayer.pause();
                                              AudioService.pause();
                                            } else {
                                              await audioPlayer.play(url);
                                              AudioService.play();
                                            }
                                          },
                                        ),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(right: 16)),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            const Color(0xFF9966DD),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.stop,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          iconSize: 20,
                                          onPressed: () async {
                                            await audioPlayer.stop();
                                            AudioService.stop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            );
                          }),
                    ),
                  );
                } else {
                  return Scaffold(
                      backgroundColor: const Color(0xFF4E5752),
                      body: StreamBuilder(
                          stream: AudioService.playbackStateStream,
                          builder: (context, snapshot) {
                            PlaybackState? state =
                                snapshot.data as PlaybackState?;
                            return Column(children: [
                              if (state?.processingState ==
                                  AudioProcessingState.connecting) ...[
                                const CircularProgressIndicator(
                                    color: Color(0xFF9966DD))
                              ] else ...[
                                Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: Hero(
                                              tag: "${widget.book.id}_image",
                                              child: CachedNetworkImage(
                                                  imageUrl: widget.book.image,
                                                  fit: BoxFit.cover),
                                            ),
                                            width: 80,
                                            height: 30,
                                          ),
                                          Text(
                                            title!,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(children: [
                                        Slider(
                                          min: 0,
                                          max: duration.inSeconds.toDouble(),
                                          value: position.inSeconds.toDouble(),
                                          activeColor: const Color(0xFF9966DD),
                                          inactiveColor:
                                              const Color(0x8BFFFFFF),
                                          onChanged: (value) async {
                                            final position = Duration(
                                                minutes: value.toInt());
                                            await audioPlayer.seek(position);
                                            await audioPlayer.resume();
                                          },
                                        ),
                                      ]),
                                    ]))
                              ],
                            ]);
                          }));
                }
              },
            ),
          ]
        ],
      ),
    );
  }
}
