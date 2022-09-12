import 'package:aubooks/pages/telaInicial/primary_screen.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AudioServiceWidget(child: const AuBooksApp()));
}

class AuBooksApp extends StatelessWidget {
  const AuBooksApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimaryScreen(),
    );
  }
}