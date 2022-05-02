import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Form(
        child: ListView(
          children: <Widget>[
            HeaderImageAsset(),
            Container(
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 100.0,
                    ),
                    LogoImageAsset(),
                  ],
                ),


            ),
          ],
        ),
      ),
    );
  }
}

class LogoImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo-aubooks.png');
    Image image = Image(image: assetImage, height: 40);
    return Container(
      alignment: Alignment.center,
      child: image,
    );
  }
}

class HeaderImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/header.png');
    Image image = Image(image: assetImage, height: 60,
        fit:BoxFit.fitWidth);
    return Container(
      child: image,
    );
  }
}
