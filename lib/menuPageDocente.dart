import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/registroNotasPage.dart';

// Import the firebase_core and cloud_firestore plugin

// ignore: must_be_immutable
class MenuPageDocente extends StatefulWidget {
  MenuPageDocente({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MenuPageDocenteState createState() => _MenuPageDocenteState();
}

class _MenuPageDocenteState extends State<MenuPageDocente> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email, contrasena;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu del Docente'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Registro de Notas'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegistroNotasPage(title: "Registro de Notas");
                }));
              },
            ),
            ListTile(
              title: Text('Ver Notas'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ver Alumnos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
