import 'package:flutter/material.dart';
import 'package:aubooks/resources/models/models.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class MiniPlayer extends StatelessWidget {
  final book;
  const MiniPlayer({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      backgroundColor: Color(0xFF39403E),
      body: ListView(
          children: [
            ProgressBar(
              progress: Duration(milliseconds: 1000),
              buffered: Duration(milliseconds: 2000),
              total: Duration(milliseconds: 5000),
              onSeek: (duration) {
                print('User selected a new time: $duration');
              },
            ),
          ],
      ),
    );
  }
}