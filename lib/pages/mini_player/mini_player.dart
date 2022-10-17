import 'package:aubooks/pages/home/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:aubooks/pages/home/book_details.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  _MiniPlayer createState() => _MiniPlayer();
}

class _MiniPlayer extends State<MiniPlayer> {
  final _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MiniplayerWillPopScope(
      onWillPop: () async {
        final GlobalKey<NavigatorState>? navigator = _navigatorKey.currentState;
        if (!navigator.canPop()) return true;
        navigator.pop();

        return false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Navigator(
              key: _navigatorKey,
              onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
                settings: settings,
                builder: (BuildContext context) => HomePageScreen(),
              ),
            ),
            Miniplayer(
              minHeight: 70,
              maxHeight: 370,
              builder: (height, percentage) => Center(
              child: Text('$height, $percentage'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}