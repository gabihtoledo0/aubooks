import 'package:flutter/material.dart';
import 'package:aubooks/pages/components/logo.dart';

class ForgetMyPassword extends StatefulWidget {
  const ForgetMyPassword({Key? key}) : super(key: key);

  @override
  _ForgetMyPassword createState() => _ForgetMyPassword();
}

class _ForgetMyPassword extends State<ForgetMyPassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        body: ListView(
            children: <Widget>[
            HeaderImageAsset(),
        Container(
        padding: EdgeInsets.all(32.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    const SizedBox(
    height: 36.0,
    ),
    LogoImageAsset(align: Alignment.center, height: 50),
    const SizedBox(
    height: 32.0,
    ),
          ],
    ),
    ),
    ],
    ),
    )
  }
}