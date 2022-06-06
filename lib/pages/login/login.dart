import 'package:flutter/material.dart';
import 'package:aubooks/pages/components/logo.dart';
import 'package:aubooks/pages/register/registerUser.dart';
import 'package:aubooks/pages/components/header.dart';
import 'package:aubooks/pages/forget_my_password/forget_my_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            HeaderImageAsset(),
            Container(
              padding: EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 8.0,
                    ),
                    LogoImageAsset(height: 40, align: Alignment.center),
                    const SizedBox(
                      height: 32.0,
                    ),
                    const Text(
                      "Acesse sua conta",
                      style: TextStyle(
                          fontFamily: 'Sansation',
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                        color: Color(0xFF39403E)
                      ),
                    ),
                    const SizedBox(
                      height: 32.0,
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
                      height: 26.0,
                    ),
                    TextFormField(
                      cursorColor: const Color(0xFF39403E),
                      controller: _senhaController,
                      obscureText: true,
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
                        labelText: "Senha",
                        prefixIcon: Icon
                          (Icons.vpn_key, color: Color(0xFF9966DD)),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: const Text("Esqueci minha senha",
                            style: TextStyle(
                                fontSize: 18.0,
                              fontFamily: 'Sansation',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF39403E),
                              decoration: TextDecoration.underline,
                            )
                        ),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => ForgetMyPassword()
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 36.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(color: Color(0xFF1565C0))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                        Image.asset(
                        'images/facebook.png',
                          height: 30.0,
                          width: 30.0,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Entrar com o Facebook",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold,
                              ),
                            )
                        )
                          ]
                        ),
                        textColor: Colors.white,
                        color: Colors.blue[800],
                        onPressed: () {
                          // if (_formKey.currentState.validate()) {
                          //   _auth();
                          // }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(color: Color(0xFF9966DD))),
                        child: const Text(
                          "Entrar",
                          style: TextStyle(fontSize: 18.0,
                            fontFamily: 'Sansation',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        textColor: Colors.white,
                        color: Color(0xFF9966DD),
                        onPressed: () {
                          // if (_formKey.currentState.validate()) {
                          //   _auth();
                          // }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    const Text(
                      "Não tem conta?",
                      style: TextStyle(
                          fontFamily: 'Sansation',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF39403E)
                      ),
                    ),
                    FlatButton(
                      child: const Text("Criar conta",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Sansation',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF9966DD),
                            decoration: TextDecoration.underline,
                          )
                      ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => RegisterUser()
                          ),
                        );
                      },
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
