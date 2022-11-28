import 'package:aubooks/pages/telaInicial/primary_screen.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AudioServiceWidget(child: AuBooksApp()));
  final keyApplicationId = 'A5pURiaMMrYjmNCrganQ73W46fODSxaHL4VbUu6j';
  final keyClientKey = 'SqFCyfCRTE0c8TqANJ2HNfboFYm2FtOQP5nBVl7g';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

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
    return MaterialApp(
        title: 'Login App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PrimaryScreen(),
      );
  }

  void connect() async {
    await AudioService.connect();
  }

  void disconnect() {
    AudioService.disconnect();
  }
}