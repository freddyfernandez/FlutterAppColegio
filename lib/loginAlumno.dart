import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'menuPageAlumno.dart';

// Import the firebase_core and cloud_firestore plugin

// ignore: must_be_immutable
class LoginAlumnoPage extends StatefulWidget {
  LoginAlumnoPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginAlumnoPageState createState() => _LoginAlumnoPageState();
}

class _LoginAlumnoPageState extends State<LoginAlumnoPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email, contrasena;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Complete los campos requeridos",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Ingrese el Correo",
                      labelText: "Email",
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Ingrese la contraseña",
                      labelText: "Password",
                    ),
                    onChanged: (value) {
                      contrasena = value;
                    },
                  ),
                  RaisedButton(
                    onPressed: () async {
                      try {
                        final user = await auth.signInWithEmailAndPassword(
                            email: email, password: contrasena);
                        if (user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MenuPageAlumno(
                                title: 'Pagina Principal del Estudiante');
                          }));
                        }
                      } catch (e) {}
                    },
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    color: Colors.green,
                    child: Text(
                      "Procesar",
                      style: TextStyle(fontSize: 18, fontFamily: 'rbold'),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
