import 'package:flutter/material.dart';
import 'package:aubooks/components/logo.dart';
import 'package:aubooks/pages/login/login.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import './validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key, required}) : super(key: key);

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
  Validator valida = Validator();

  final maskFormatter = MaskTextInputFormatter(
      mask: '(##)#####-####', filter: {"#": RegExp(r'[0-9]')});

  final maskFormatterDate = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  void doUserRegistration() async {
    final username = controllerUsername.text.trim();
    final surname = controllerSurname.text.trim();
    final email = controllerEmail.text.trim();
    final senha = controllerSenha.text.trim();
    final csenha = controllerCsenha.text.trim();
    final phone = controllerPhone.text.trim();
    final nasc = controllerNasc.text.trim();

    final user = ParseUser.createUser(username, phone, email);

    var response = await user.signUp();
    }
  
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
                    validator: valida.validarNome,
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
                    validator:
                      valida.validarNome,
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
                    validator:
                      valida.validarCelular,
                    inputFormatters: [maskFormatter],
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
                    inputFormatters: [maskFormatterDate],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Informe a data de nascimento";
                      }
                    },
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
                    validator:
                      valida.validarEmail,
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
                    validator:
                      valida.validarSenha,
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
                    validator: (_confSenhaController) {
                      final senha = controllerSenha.text;
                      if (_confSenhaController!.isEmpty ||
                          _confSenhaController != senha)
                        return "As senhas não conferem";
                      return null;
                    },
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

                       ), onPressed: () { doUserRegistration ();

    Navigator.push(context,
    MaterialPageRoute(
    builder: (context) => LoginScreen(),
    ),
    );}


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

  // void register() async {
  //   final String name = _nameController.text;
  //   final String surname = _surnameController.text;
  //   final String email = _emailController.text;
  //   final String senha = _senhaController.text;
  //   final String phone = _phoneController.text;
  //   final String date = _dateOfBirthController.text;

  //   showSucessDialog(context);

  //   // int inter = await interDao.insert(c);
  //   //
  //   // if (inter != null) {
  //   //   print("realizado cadastro");
  //   //   showSucessDialog(context);
  //   // } else {
  //   //   showAlertDialog(context);
  //   //   print("usuário já cadastrado");
  //   // }
  // }
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





