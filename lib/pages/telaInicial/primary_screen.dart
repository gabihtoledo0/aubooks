import 'package:flutter/material.dart';
import 'package:aubooks/components/logo.dart';
import 'package:aubooks/pages/login/login.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({Key? key}) : super(key: key);

  @override
  _PrimaryScreen createState() => _PrimaryScreen();
}

class _PrimaryScreen extends State<PrimaryScreen> {
  @override

  Widget build(BuildContext context){
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
                    "Encontre milhares de audiobooks incríveis para você",
                    style: TextStyle(
                        fontFamily: 'Sansation',
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF39403E)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Text(
                    " Agora você pode curtir seus livros gratuitamente numa boa ;)",
                    style: TextStyle(
                        fontFamily: 'Sansation',
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF39403E)
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                   SizedBox(
                     height: 50.0,
                     width: MediaQuery.of(context).size.width,
                     child: ElevatedButton(
                       /*shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8.0),
                           side: const BorderSide(color: Color(0xFF9966DD))),*/
                       child: const Text(
                         "Entrar",
                         style: TextStyle(fontSize: 18.0,
                           fontFamily: 'Sansation',
                           fontWeight: FontWeight.w700,
                         ),
                       ),
                       /*textColor: Colors.white,
                       color: Color(0xFF9966DD),*/
                       onPressed: () {
                         Navigator.push(context,
                           MaterialPageRoute(
                               builder: (context) => LoginScreen()
                           ),
                         );
                       },
                     ),
                   ),
                ]
            )
          )
        ]
      ),
    );
  }
}

class HeaderImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/header-primary.png');
    Image image = Image(image: assetImage, height: 200,
        fit:BoxFit.fitWidth);
    return Container(
      child: image,
    );
  }
}
