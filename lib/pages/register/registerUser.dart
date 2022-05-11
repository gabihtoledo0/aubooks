import 'package:flutter/material.dart';
import 'package:aubooks/pages/components/logo.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUser createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confSenhaController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: LogoImageAsset(height: 23,
            align: Alignment.centerRight,),
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
            padding: EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _nameController,
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
                      prefixIcon: Icon(Icons.person,
                          color: Color(0xFF9966DD)),
                    ),
                    keyboardType: TextInputType.name,
                    // validator: valida.validarNome,
                  ),
                  SizedBox(
                    height: 16.0,
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