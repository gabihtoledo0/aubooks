import 'package:audio_service/audio_service.dart';
import 'package:aubooks/resources/models/models.dart';
import 'package:aubooks/resources/player_res.dart';
import 'package:aubooks/resources/repository.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:aubooks/widgets/player_widget.dart';
import 'package:we_slide/we_slide.dart';
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
  bool? playStandBy;
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
    playStandBy = false;

    // playbackStateListner = AudioService.playbackStateStream.listen((state) {
    //   if (state.processingState == AudioProcessingState.stopped) if (toplay!) {
    //     start();
    //     if (mounted) {
    //       toplay = false;
    //       playStandBy = false;
    //     }
    //   }
    // });

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        playStandBy = state == AudioPlayerState.PLAYING;
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
    audioPlayer.dispose();
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
              Expanded(child:
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
              ),
              const SizedBox(height: 32),
              const Text("Descrição:",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Sansation',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF),
                  )),
              const SizedBox(height: 16),
              Text(
                  widget.book.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Sansation',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF),
                  )),
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
                    return Expanded(child:
                    Column(
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
                          AudioService.stop();
                          await audioPlayer.stop();

                          setState(() {
                            toplay = true;
                            playStandBy = true;
                            url = item.url;
                            title = item.title;
                          });
                          // start();
                          AudioService.play();
                          await audioPlayer.play(url);

                          // Navigator.push(context,
                          //     MaterialPageRoute(
                          //     builder: (context) => PlayerWidget(key: Key(item.url),
                          //     url: item.url, title: item.title, image: widget.book.image)));
                        },
                      ))
                          .toList(),
                    ),
                    );
                  } else {
                    return Expanded(
                      child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                                color: Color(0xFF9966DD)),
                          ]),
                    );
                  }
                },
              ),
            ],
          ),
          if (toplay == true) ...[
            Miniplayer(
              minHeight: 90,
              maxHeight: 400,
              onDismiss: () {
                toplay == false;
              },
              builder: (height, percentage) {
                if (percentage > 0.2) {
                  return Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xf9966dd0), Color(0xf910091b)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: StreamBuilder(
                            stream: AudioService.playbackStateStream,
                            builder: (context, snapshot) {
                              PlaybackState? state =
                              snapshot.data as PlaybackState?;
                              return Expanded(
                                child: Column(
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
                                    const SizedBox(height: 18),
                                    Text(
                                      title!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFFFFFFF),
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
                                          final position = Duration(seconds: value.toInt());
                                          await audioPlayer.seek(position);
                                          await audioPlayer.resume();
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                position.toString().split(".")[0],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Sansation',
                                                    color: Color(0xFFFFFFFF)),
                                              ),
                                              Text(
                                                (duration - position).toString().split(".")[0],
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Sansation',
                                                    color: Color(0xFFFFFFFF)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 20)),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                              const Color(0xFF9966DD),
                                              child: IconButton(
                                                icon: Icon(
                                                  playStandBy == true
                                                      ? Icons.pause
                                                      : Icons.play_arrow,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                                iconSize: 20,
                                                onPressed: () async {
                                                  if (playStandBy == true) {
                                                    // setState(() {
                                                    //   playStandBy = false;
                                                    // });
                                                    await audioPlayer.pause();
                                                    AudioService.pause();
                                                  } else {
                                                    // setState(() {
                                                    //   playStandBy = true;
                                                    // });
                                                    await audioPlayer.play(url);
                                                    AudioService.play();
                                                  }
                                                },
                                              ),
                                            ),
                                            const Padding(
                                                padding:
                                                EdgeInsets.only(right: 16)),
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
                                                  setState(() {
                                                    toplay = false;
                                                  });
                                                  await audioPlayer.stop();
                                                  AudioService.stop();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              );
                            }),
                      ),
                    );


                } else {
                  return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF5C6562),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: StreamBuilder(
                          stream: AudioService.playbackStateStream,
                          builder: (context, snapshot) {
                            PlaybackState? state =
                                snapshot.data as PlaybackState?;
                            return Column(children: [
                              if (state?.processingState ==
                                  AudioProcessingState.connecting) ...[
                                Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        CircularProgressIndicator(
                                            color: Color(0xFF9966DD)),
                                      ]),
                                ),
                              ] else ...[
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        child: Hero(
                                          tag: "${widget.book.id}_image",
                                          child: CachedNetworkImage(
                                              imageUrl: widget.book.image,
                                              fit: BoxFit.cover),
                                        ),
                                        width: 80,
                                        height: 90,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(right: 16)),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  title!,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Sansation',
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 8)),
                                                Text(
                                                  widget.book.author,
                                                  style: const TextStyle(
                                                      fontFamily: 'Sansation',
                                                      fontSize: 12,
                                                      color: Color(0xFFFFFFFF)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8)),
                                            Row(
                                              children: [
                                                IconButton(
                                                  color: Colors.white,
                                                  iconSize: 32.0,
                                                  onPressed: () async {
                                                    if (playStandBy == true) {
                                                      // setState(() {
                                                      //   playStandBy = true;
                                                      // });
                                                      await audioPlayer.pause();
                                                      AudioService.pause();
                                                    } else {
                                                      // setState(() {
                                                      //   playStandBy = false;
                                                      // });
                                                      await audioPlayer.play(url);
                                                      AudioService.play();
                                                    }
                                                  },
                                                  icon: Icon(
                                                    playStandBy == true
                                                        ? Icons.pause
                                                        : Icons.play_arrow,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.stop,
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  iconSize: 32,
                                                  onPressed: () async {
                                                    setState(() {
                                                      toplay = false;
                                                    });
                                                    await audioPlayer.stop();
                                                    AudioService.stop();
                                                  },
                                                ),
                                              ],
                                            ),
                                        ],
                                      )),
                                      const Padding(
                                          padding: EdgeInsets.only(right: 16)),
                                    ],
                                  ),
                                )
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
