import 'package:flutter/material.dart';
import 'package:password/password.dart';
import 'package:provider/provider.dart';

import '../../../models/index.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  String _email, _name, _nick, _hash, _token;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('REGISTRO DE USUARIO'),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                  ),
                  onSaved: (string) => _name = string,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Correo UCO',
                  ),
                  onSaved: (string) => _email = string,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nickname',
                  ),
                  onSaved: (string) => _nick = string,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                  ),
                  onSaved: (string) => _hash = Password.hash(string, PBKDF2()),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Token de registro',
                  ),
                  onSaved: (string) => _token = string,
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                      '''Con el registro y/o instalación de esta aplicación, el usuario consiente el tratamiento y uso de los datos que se generen con finalidades estrictamente académicas y de investigación. Asimismo, el registro implica que el usuario reconoce no presentar ninguno de los siguientes criterios de exclusión:

- Imposibilidad para instalar y/o utilizar la aplicación durante la totalidad del periodo de seguimiento (un mes).
- Negativa a colaborar en la cumplimentación de escalas de satisfacción u otros cuestionarios
destinados a la evaluación de la experiencia al final de la misma.

El tratamiento de datos se hará conforme a la RGPD del 25 de Mayo de 2018.'''),
                ),
                Builder(
                  builder: (context) => FlatButton(
                    child: Text('REGISTRARME'),
                    onPressed: () async {
                      (_formKey.currentState as FormState).save();

                      if (await model.signup(
                        email: _email,
                        name: _name,
                        nick: _nick,
                        hash: _hash,
                        token: _token,
                      ))
                        Navigator.pop(context, true);
                      else
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Se ha producido un error'),
                        ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
