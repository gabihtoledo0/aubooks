import 'package:aubooks/pages/telaInicial/primary_screen.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:aubooks/resources/notifiers/audio_books_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AudioServiceWidget(child: AuBooksApp()));
}

class AuBooksApp extends StatefulWidget {
  @override
  _AuBooksAppState createState() => _AuBooksAppState();
}

class _AuBooksAppState extends State<AuBooksApp> with WidgetsBindingObserver {
  @override
  void initState() {
    connect();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    disconnect();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        connect();
        break;
      case AppLifecycleState.paused:
        disconnect();
        break;
      default:
        break;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioBooksNotifier(),
      child: MaterialApp(
        title: 'Login App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PrimaryScreen(),
      ),
    );
  }

  void connect() async {
    await AudioService.connect();
  }

  void disconnect() {
    AudioService.disconnect();
  }
}