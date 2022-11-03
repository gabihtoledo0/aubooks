import 'package:audio_service/audio_service.dart';
import 'package:aubooks/resources/models/models.dart';
import 'package:aubooks/resources/player_res.dart';
import 'package:aubooks/resources/repository.dart';
import 'package:aubooks/widgets/player_service.dart';
import 'package:aubooks/widgets/player_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  final Book book;
  DetailPage(this.book);

  @override
  DetailPageState createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
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
    playbackStateListner = AudioService.playbackStateStream.listen((state){
      if(state.processingState == AudioProcessingState.stopped)
        if(toplay!){
          start();
          if(mounted)
            toplay = false;
        }
    });
  }

  @override
  void dispose() {
    playbackStateListner.cancel();
    super.dispose();
  }

  Future<List<AudioFile>>_getRssFeeds() {
    return Repository().fetchAudioFiles(widget.book.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.book.title),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.fromLTRB(20.0,20.0,20.0, url != null ? 70 : 20),
              children: <Widget>[
                Container(height: 120,
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag: "${widget.book.id}_image",
                        child: CachedNetworkImage(
                            imageUrl: widget.book.image, fit: BoxFit.contain),
                      ),
                      SizedBox(width: 20.0),
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
                                  fontSize: 18.0
                              ),
                            ),
                            Text("${widget.book.author}", style: Theme.of(context).textTheme.subtitle1?.copyWith()),
                            SizedBox(height: 5.0,),
                            Text("Total time: ${widget.book.totalTime}", style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: FutureBuilder(
                    future: _getRssFeeds(),
                    builder: (BuildContext context, AsyncSnapshot<List<AudioFile>> snapshot){
                      if(snapshot.hasData){
                        return Column(
                          children: snapshot.data!.map((item)=>ListTile(
                            title: Text(item.title),
                            leading: const Icon(Icons.play_circle_filled),
                            onTap: () async {
                              // if(url == item.url) AudioService.play();
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setString("play_url", item.url);
                              await prefs.setString("book_id", item.bookId);
                              await prefs.setInt("track", snapshot.data!.indexOf(item));

                              CustomAudioPlayer().onStop();
                              setState(() {
                                toplay = true;
                              });

                              start();
                              setState(() {
                                url = item.url;
                                title = item.title;
                              });

                              Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => PlayerWidget(key: Key(item.url),
                                      url: item.url, title: item.title, image: widget.book.image),
                                ),
                              );
                            },
                          )).toList(),
                        );
                      }else{
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

}