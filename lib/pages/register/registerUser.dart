import 'package:flutter/material.dart';
import 'package:aubooks/pages/components/logo.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUser createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context){
    return Scaffold(backgroundColor: Colors.green[50],
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
            padding: EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Align(
                    alignment: Alignment.centerRight,
                    child: LogoImageAsset(height: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}