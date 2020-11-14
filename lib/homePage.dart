import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/login.dart';

import 'loginAlumno.dart';

// Import the firebase_core and cloud_firestore plugin

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Tu aplicacion de colegio para gestionar la informacion de los estudiantes y docentes',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Image.asset('assets/inicio.jpg'),
                ],
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                color: Color.fromARGB(255, 66, 165, 245),
                child: new Text(
                  "Ingrese como estudiante o docente",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                alignment: Alignment(0.0, 0.0),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginAlumnoPage(title: "Inicio de Sesion");
                      }));
                    },
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    color: Color.fromARGB(255, 66, 165, 245),
                    child: Text(
                      "Estudiante",
                      style: TextStyle(fontSize: 18, fontFamily: 'rbold'),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage(title: "Inicio de Sesion");
                      }));
                    },
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    color: Color.fromARGB(255, 66, 165, 245),
                    child: Text(
                      "Docente",
                      style: TextStyle(fontSize: 18, fontFamily: 'rbold'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
