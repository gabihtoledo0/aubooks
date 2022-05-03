import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
                  children: [
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 8.0,
                    ),
                    LogoImageAsset(),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      "Acesse sua conta",
                      style: TextStyle(
                          fontFamily: 'Sansation',
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                        color: Color(0xFF39403E)
                      ),
                    ),
                    SizedBox(
                      height: 26.0,
                    ),
                    TextFormField(
                      cursorColor: const Color(0xFF39403E),
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF39403E),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF9966DD),
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF9966DD),
                            )),
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email, color: Color(0xFF9966DD)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      // validator: (_emailController) {
                      //   if (_emailController.isEmpty || !_emailController.contains("@"))
                      //     return "Email inválido";
                      // },
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
