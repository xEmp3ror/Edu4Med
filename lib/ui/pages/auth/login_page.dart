import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/index.dart';
import 'index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool _loading = false;
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('INICIAR SESIÓN'),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Correo UCO',
                ),
                onSaved: (string) => _email = string,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                ),
                onSaved: (string) => _password = string,
              ),
              Builder(
                builder: (context) => FlatButton(
                  child: Text('ACCEDER'),
                  onPressed: () async {
                    setState(() => _loading = true);

                    (_formKey.currentState as FormState).save();

                    if (await model.login(email: _email, password: _password))
                      Navigator.of(context).pushReplacementNamed('/main');
                    else {
                      setState(() => _loading = false);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Se ha producido un error'),
                      ));
                    }
                  },
                ),
              ),
              FlatButton(
                child: Text('REGISTRARME'),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );

                  if (result == true) {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: Text('Registro correcto'),
                        children: <Widget>[
                          Text('Procede ahora a loguearte en la aplicacion')
                        ],
                      ),
                    );
                  }
                },
              ),
              if (_loading) CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
