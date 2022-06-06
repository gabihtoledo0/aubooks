import 'package:flutter/material.dart';
import 'package:aubooks/pages/components/logo.dart';
import 'package:aubooks/pages/components/header.dart';
import '../confirm_password/confirm_password.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword ({Key? key}) : super(key: key);

  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  final TextEditingController _senhaController = TextEditingController();

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
                  "Faça a troca de senha.",
                  style: TextStyle(
                      fontFamily: 'Sansation',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF39403E)
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 35.0,
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
                    labelText: "Nova senha",
                    prefixIcon: Icon
                      (Icons.vpn_key, color: Color(0xFF9966DD)),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 30.0,
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
                    labelText: "Confirme sua Senha",
                    prefixIcon: Icon
                      (Icons.vpn_key, color: Color(0xFF9966DD)),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: Color(0xFF9966DD))),
                    child: const Text(
                      "Confirmar",
                      style: TextStyle(fontSize: 18.0,
                        fontFamily: 'Sansation',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Color(0xFF9966DD),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmPassword()
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}