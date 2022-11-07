import 'package:aubooks/pages/home/homepage_navigation.dart';
import 'package:flutter/material.dart';
import 'package:aubooks/components/logo.dart';
import 'package:aubooks/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUser createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerSurname = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSenha = TextEditingController();
  final controllerCsenha = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerNasc = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: LogoImageAsset(
            height: 23,
            align: Alignment.centerRight,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF39403E)),
        backgroundColor: Colors.green[50],
      ),
      backgroundColor: Colors.green[50],
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: controllerUsername,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Sansation',
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF39403E),
                      ),
                      labelText: "Nome",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFF9966DD),
                      )),
                      prefixIcon: Icon(Icons.person, color: Color(0xFF9966DD)),
                    ),
                    keyboardType: TextInputType.name,
                    // validator: valida.validarNome,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: controllerSurname,
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
                      labelText: "Sobrenome",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.supervisor_account,
                          color: Color(0xFF9966DD)),
                    ),
                    keyboardType: TextInputType.name,
                    // validator: valida.validarNome,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: controllerPhone,
                    // inputFormatters: [maskFormatter],
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
                      labelText: "Celular",
                      border: OutlineInputBorder(),
                      prefixIcon:
                          Icon(Icons.local_phone, color: Color(0xFF9966DD)),
                    ),
                    keyboardType: TextInputType.phone,
                    // validator: valida.validarCelular,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: controllerNasc,
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
                      labelText: "Data de Nascimento",
                      border: OutlineInputBorder(),
                      prefixIcon:
                          Icon(Icons.date_range, color: Color(0xFF9966DD)),
                    ),
                    keyboardType: TextInputType.datetime,
                    // validator: valida.validarNome,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: controllerEmail,
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
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: Color(0xFF9966DD)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    // validator: valida.validarEmail,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: controllerSenha,
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
                      labelText: "Senha",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.vpn_key, color: Color(0xFF9966DD)),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    // validator: valida.validarSenha,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: controllerCsenha,
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
                      labelText: "Confirme sua senha",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.vpn_key, color: Color(0xFF9966DD)),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    // validator: (_confSenhaController) {
                    //   final senha = _senhaController.text;
                    //   if (_confSenhaController.isEmpty ||
                    //       _confSenhaController != senha)
                    //     return "As senhas não conferem";
                    // },
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                   SizedBox(
                     height: 50.0,
                     width: MediaQuery.of(context).size.width,
                     child: ElevatedButton(
                       /*shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8.0),
                           side: BorderSide(color: Color(0xFFF8BBD0))),*/
                       child: const Text(
                         "Assinar gratuitamente",
                         style: TextStyle(
                             fontSize: 18.0, fontWeight: FontWeight.bold),
                       ),
                       /*textColor: Colors.white,
                       color: Color(0xFF9966DD),*/
                       onPressed: () {
                         Navigator.push(context,
                           MaterialPageRoute(
                             builder: (context) => LoginScreen(),
                           ),
                         );

                         // if (_formKey.currentState.validate()) {
                         //   register();
                         // }
                       },
                     ),
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

showAlertDialog(BuildContext context) {
  // configura o button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Email já cadastrado"),
    content: Text(
        "Tente cadastrar outro email ou vá até a tela de login e entre com esse email."),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

showSucessDialog(BuildContext context) {
  // configura o button
  Widget loginButton = TextButton(
    child: Text("LOGIN"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Usuário cadastrado com sucesso"),
    actions: [
      loginButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );}
/*
  void doUserRegistration() async {
    final username = controllerUsername.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerSenha.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();}
*/




