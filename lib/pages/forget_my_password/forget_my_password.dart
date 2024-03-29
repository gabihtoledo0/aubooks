import 'package:flutter/material.dart';
import 'package:aubooks/components/logo.dart';
import 'package:aubooks/components/header.dart';
import '../confirm_password/confirm_password.dart';

class ForgetMyPassword extends StatefulWidget {
  const ForgetMyPassword ({Key? key}) : super(key: key);

  @override
  _ForgetMyPassword createState() => _ForgetMyPassword();
}

class _ForgetMyPassword extends State<ForgetMyPassword> {
  final TextEditingController _emailController = TextEditingController();

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
      const Text(
        "Preencha seu email para enviarmos um token de acesso a troca de senha.",
        style: TextStyle(
            fontFamily: 'Sansation',
            fontSize: 25,
            fontWeight: FontWeight.w300,
            color: Color(0xFF39403E)
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 75.0,
      ),
      TextFormField(
        cursorColor: const Color(0xFF39403E),
        controller: _emailController,
        decoration: const InputDecoration(
          labelStyle: TextStyle(
            fontSize: 18,
            fontFamily: 'Sansation',
            fontWeight: FontWeight.w300,
            color: Color(0xFF39403E),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF9966DD),
              )),
          border: OutlineInputBorder(),
          labelText: "Email",
          prefixIcon: Icon
            (Icons.email, color: Color(0xFF9966DD)),
        ),
        keyboardType: TextInputType.emailAddress,
        // validator: (_emailController) {
        //   if (_emailController.isEmpty || !_emailController.contains("@"))
        //     return "Email inválido";
        // },
      ),
      const SizedBox(
        height: 30.0,
      ),
      // SizedBox(
      //   height: 50.0,
      //   width: MediaQuery.of(context).size.width,
      //   child: RaisedButton(
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(8.0),
      //         side: const BorderSide(color: Color(0xFF9966DD))),
      //     child: const Text(
      //       "Enviar token",
      //       style: TextStyle(fontSize: 18.0,
      //         fontFamily: 'Sansation',
      //         fontWeight: FontWeight.w700,
      //       ),
      //     ),
      //     textColor: Colors.white,
      //     color: Color(0xFF9966DD),
      //     onPressed: () {
      //       Navigator.push(context,
      //         MaterialPageRoute(
      //             builder: (context) => ConfirmPassword()
      //         ),
      //       );
      //     },
      //   ),
      // ),
    ],
    ),
    ),
    ],
    ),
    );

  }
}


