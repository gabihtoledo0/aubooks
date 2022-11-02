import 'dart:math';
import 'package:just_audio/just_audio.dart';
import 'package:aubooks/resources/player.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:audio_service/audio_service.dart';
import 'package:rxdart/rxdart.dart';

class PlayerWidget extends StatefulWidget {
  final String url;
  final String title;
  final String image;
  final queuee;

  PlayerWidget({key, required this.url, required this.title, required this.image, required this.queuee}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _PlayerState(url, title, image, queuee);
  }
}

class _PlayerState extends State<PlayerWidget> {
  final BehaviorSubject<double> _dragPositionSubject = BehaviorSubject.seeded(null);
  // final audioPlayer = AudioPlayer();
  String url;
  final queuee;
  String image;
  String title;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool _loading = false;

  _PlayerState(this.url, this.title, this.image, this.queuee);

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  // @override
  // void dispose(){
  //   audioPlayer.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xFF39403E),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: StreamBuilder(
          // stream: _audioStateStream,
      builder: (context, AsyncSnapshot snapshot) {
      PlaybackState? state = snapshot.data as PlaybackState?;
      // final queue = state?.queue;
      MediaItem media = snapshot.data as MediaItem;
      final mediaItem = snapshot.data?.mediaItem;
      final playbackState = state;
      final processingState = state?.processingState ?? AudioProcessingState.none;
      final playing = state?.playing ?? false;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                height: 350,
                width: double.infinity,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        if (processingState == AudioProcessingState.none) ...[
          _startAudioPlayerBtn(),
        ] else ... [
          positionIndicator(mediaItem, playbackState!),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: Icon(
                playing ? Icons.pause : Icons.play_arrow,
              ),
              iconSize: 50,
              onPressed: () async {
                if(!playing){
                  AudioService.play();
                } else {
                  AudioService.pause();
                }
              },
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: const Icon(
                  Icons.stop
              ),
              iconSize: 50,
              onPressed: () async {
                AudioService.stop();
              },
            ),
          ),
          ],
        ],
      );
      }
      ),
    ),
  );

  _startAudioPlayerBtn() {
    List<dynamic> list = [];
    for (int i = 0; i < 2; i++) {
      var m = queuee[i].toJson();
      list.add(m);
    }
    var params = {"data": list};
    return MaterialButton(
      child: Text(_loading ? "Loading..." : 'Start Audio Player'),
      onPressed: () async {
        setState(() {
          _loading = true;
        });
        await AudioService.start(
          backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
          androidNotificationChannelName: 'Audio Player',
          androidNotificationColor: 0xFF2196f3,
          androidNotificationIcon: 'mipmap/ic_launcher',
          params: params,
        );
        setState(() {
          _loading = false;
        });
      },
    );
  }

  Widget positionIndicator(MediaItem mediaItem, PlaybackState state) {
    double? seekPos;
    return StreamBuilder(
      stream: Rx.combineLatest2<double, double, double>(
          _dragPositionSubject.stream,
          Stream.periodic(const Duration(milliseconds: 200)),
              (dragPosition, _) => dragPosition),
      builder: (context, snapshot) {
         double position = state.currentPosition.inMilliseconds.toDouble();
        double duration = mediaItem.duration.inMilliseconds.toDouble();
        return Column(
          children: [
            if (duration != null)
              Slider(
                min: 0.0,
                max: duration,
                value: seekPos ?? max(0.0, min(position, duration)),
                onChanged: (value) {
                  _dragPositionSubject.add(value);
                },
                onChangeEnd: (value) {
                  AudioService.seekTo(Duration(milliseconds: value.toInt()));
                  // Due to a delay in platform channel communication, there is
                  // a brief moment after releasing the Slider thumb before the
                  // new position is broadcast from the platform side. This
                  // hack is to hold onto seekPos until the next state update
                  // comes through.
                  // TODO: Improve this code.
                  seekPos = value;
                  _dragPositionSubject.add(null);
                },
              ),
            Text("${state.currentPosition}"),
          ],
        );
      },
    );
  }
}

Stream<AudioState> get _audioStateStream {
  return Rx.combineLatest3<List<MediaItem>, MediaItem, PlaybackState,
      AudioState>(
    AudioService.queueStream,
    AudioService.currentMediaItemStream,
    AudioService.playbackStateStream,
        (queue, mediaItem, playbackState) => AudioState(
      queue,
      mediaItem,
      playbackState,
    ),
  );
}
void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}





// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
//
// enum PlayerState { stopped, playing, paused }
//
// enum PlayerMode {
//   MEDIA_PLAYER
// }
//
// class PlayerWidget extends StatefulWidget {
//   final String url;
//   final bool isLocal;
//   final PlayerMode mode;
//   final String title;
//
//   PlayerWidget(
//       {key, required this.url,
//       required this.title,
//       this.isLocal = false,
//       this.mode = PlayerMode.MEDIA_PLAYER}):super(key:key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return new _PlayerWidgetState(url, title,isLocal, mode,);
//   }
// }
//
//
// class _PlayerWidgetState extends State<PlayerWidget> {
//   String url;
//   bool isLocal;
//   PlayerMode mode;
//   String title;
//
//   AudioPlayer? _audioPlayer;
//   Duration? _duration;
//   Duration? _position;
//
//   PlayerState? _playerState = PlayerState.stopped;
//   StreamSubscription? _durationSubscription;
//   StreamSubscription? _positionSubscription;
//   StreamSubscription? _playerCompleteSubscription;
//   StreamSubscription? _playerErrorSubscription;
//   StreamSubscription? _playerStateSubscription;
//
//   get _isPlaying => _playerState == PlayerState.playing;
//   get _isPaused => _playerState == PlayerState.paused;
//   get _durationText => _duration?.toString()?.split('.')?.first ?? '';
//   get _positionText => _position?.toString()?.split('.')?.first ?? '';
//
//   _PlayerWidgetState(this.url, this.title, this.isLocal, this.mode);
//
//   @override
//   void initState() {
//     super.initState();
//     _initAudioPlayer();
//   }
//   @override
//   void didChangeDependencies() {
//     _play();
//     super.didChangeDependencies();
//   }
//
//   @override
//   void didUpdateWidget(PlayerWidget oldWidget) {
//     print("widget updated");
//     if(oldWidget.url != url) {
//       print("changed ${oldWidget.title} $title" );
//       _audioPlayer?.release();
//       _position = null;
//       _duration = null;
//       _audioPlayer?.setUrl(url);
//       _play();
//     }
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void dispose() {
//     _audioPlayer?.stop();
//     _durationSubscription?.cancel();
//     _positionSubscription?.cancel();
//     _playerCompleteSubscription?.cancel();
//     _playerErrorSubscription?.cancel();
//     _playerStateSubscription?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: Text(title),
//     ),
//     backgroundColor: Color(0xFF39403E),
//     body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           if(title != null)
//           const SizedBox(height: 10.0),
//           if(title != null)
//             Padding(
//               padding: const EdgeInsets.only(left: 16, right:16),
//               child: Text(title.length < 50 ? title : title.substring(0,47) + "...", style: const TextStyle(
//                 fontSize: 16.0,
//               fontWeight: FontWeight.bold
//             ),
//           ),
//         ),
//         IconButton(
//           color: Theme.of(context).primaryColor,
//           onPressed: _isPlaying ? () => _pause() : () => _play(),
//           iconSize: 32.0,
//           icon: new Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
//         ),
//         IconButton(
//           color: Colors.red,
//           onPressed: _isPlaying || _isPaused ? () => _stop() : null,
//           iconSize: 32.0,
//           icon: new Icon(Icons.stop),
//         ),
//         Text(
//           _position != null
//               ? '${_positionText ?? ''} / ${_durationText ?? ''}'
//               : _duration != null ? _durationText : '',
//           style: new TextStyle(fontSize: 16.0),
//         ),
//         Expanded(
//           child: Slider(
//             min: 0.0,
//             max: _duration != null ? _duration!.inMilliseconds.toDouble() : 100,
//             onChanged: _duration != null ? _onSeek : null,
//             value: (_position != null)
//                 ? _position!.inMilliseconds.toDouble()
//                 : 0.0,
//             // valueColor: new AlwaysStoppedAnimation(Colors.cyan),
//           ),
//         ),
//           // ProgressBar(
//           //   progress: Duration(milliseconds: _position != null ? _position!.inMilliseconds.toInt() : 0),
//           //   total: Duration(milliseconds: _duration != null ? _duration!.inMilliseconds.toInt() : 100),
//           //   onSeek: (duration) {
//           //     setState(() {
//           //       _position = Duration(milliseconds: duration.inMilliseconds.toInt());
//           //     });
//           //     return _audioPlayer!.seek(Duration(milliseconds: duration.inMilliseconds.toInt()));
//           //   },
//           // ),
//            Row(
//             children: const [
//               SizedBox(width: 20.0),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _initAudioPlayer() {
//     _audioPlayer = AudioPlayer(mode: mode);
//     _durationSubscription =
//         _audioPlayer?.onDurationChanged.listen((duration) => setState(() {
//               _duration = duration;
//             }));
//
//     _positionSubscription =
//         _audioPlayer?.onAudioPositionChanged.listen((p) => setState(() {
//               _position = p;
//             }));
//
//     _playerCompleteSubscription =
//         _audioPlayer?.onPlayerCompletion.listen((event) {
//       _onComplete();
//       setState(() {
//         _position = _duration;
//       });
//     });
//
//     _playerErrorSubscription = _audioPlayer?.onPlayerError.listen((msg) {
//       print('audioPlayer error : $msg');
//       setState(() {
//         _playerState = PlayerState.stopped;
//         _duration = Duration(seconds: 0);
//         _position = Duration(seconds: 0);
//       });
//     });
//   }
//
//   Future<int> _onSeek(double value) async {
//     setState(() {
//       _position = Duration(milliseconds: value.toInt());
//     });
//     return _audioPlayer!.seek(Duration(milliseconds: value.toInt()));
//   }
//
//   Future<int> _play() async {
//     final playPosition = (_position != null &&
//             _duration != null &&
//             _position!.inMilliseconds > 0 &&
//             _position!.inMilliseconds < _duration!.inMilliseconds)
//         ? _position
//         : null;
//     final result =
//         await _audioPlayer!.play(url, isLocal: isLocal, position: playPosition);
//     if (result == 1) setState(() => _playerState = PlayerState.playing);
//     return result;
//   }
//
//   Future<int> _pause() async {
//     final result = await _audioPlayer!.pause();
//     if (result == 1) setState(() => _playerState = PlayerState.paused);
//     return result;
//   }
//
//   Future<int> _stop() async {
//     final result = await _audioPlayer!.stop();
//     if (result == 1) {
//       setState(() {
//         _playerState = PlayerState.stopped;
//         _position = Duration();
//       });
//     }
//     return result;
//   }
//
//   void _onComplete() {
//     setState(() => _playerState = PlayerState.stopped);
//   }
// }