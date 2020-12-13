import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/homePage.dart';
import 'package:proyectoflutter/registroNotasPage.dart';
import 'package:json_table/json_table.dart';
import 'package:proyectoflutter/alumnoServicio.dart';
import 'package:proyectoflutter/notaServicio.dart';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'dart:convert';

// Import the firebase_core and cloud_firestore plugin

// ignore: must_be_immutable
class MenuPageDocente extends StatefulWidget {
  final String title;

  String correo;
  List<AlumnoServicio> listaServicio = [];
  List<NotaServicio> listanotaServicio = [];

  int codigoServicioSeleccionado = 0;
  String urlPrincipal = 'https://myappcolegio.herokuapp.com/';
  String urlController = "colegio/";
  String micorreo;
  //URL DE TIPO JSON LISTADO OBJETO  "[{}]"
  String urlListado = "listarAlumnos/";
  String urlListado2 = "listarNotas/";

  String jSonAlumnos =
      '[{"codigoAlumno": 0,"nombreAlumno": "","correoAlumno": "","gradoAlumno": ""}]';
  String jSonNotas = '[{"codigoNota": 0,"calificacion": 0.0}]';

  MenuPageDocente({Key key, this.title, this.correo}) : super(key: key);

  @override
  _MenuPageDocenteState createState() => _MenuPageDocenteState();
}

class _MenuPageDocenteState extends State<MenuPageDocente> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email, contrasena;

  @override
  void initState() {
    super.initState();
  }

  Future<String> _consultarServiciosAlumnos() async {
    String urlListaServicios =
        widget.urlPrincipal + widget.urlController + widget.urlListado;

    var respuesta = await http.get(urlListaServicios);
    var data = respuesta.body;

    //OBTIENE LOS DATOS JSON A OBJETOS
    var oListaServiciosTmp = List<AlumnoServicio>.from(
        json.decode(data).map((x) => AlumnoServicio.fromJson(x)));

    setState(() {
      //ASIGNA A UNA LISTA VACIA LA LISTA DE OBJETOS
      widget.listaServicio = oListaServiciosTmp;
      //ASIGNA A UN STRING, UNA CADENA JSON TIPO STRING
      widget.jSonAlumnos = data;

      if (widget.listaServicio.length == 0) {
        widget.jSonAlumnos =
            '[{"codigoAlumno": 0,"nombreAlumno": "","correoAlumno": "","gradoAlumno": ""}]';
      }
    });

    return "Procesado";
  }

  Future<String> _consultarServiciosNotas() async {
    String urlListaServicios =
        widget.urlPrincipal + widget.urlController + widget.urlListado2;

    var respuesta = await http.get(urlListaServicios);
    var data = respuesta.body;

    //OBTIENE LOS DATOS JSON A OBJETOS
    var oListaServiciosTmp = List<NotaServicio>.from(
        json.decode(data).map((x) => NotaServicio.fromJson(x)));

    setState(() {
      //ASIGNA A UNA LISTA VACIA LA LISTA DE OBJETOS
      widget.listanotaServicio = oListaServiciosTmp;
      //ASIGNA A UN STRING, UNA CADENA JSON TIPO STRING
      widget.jSonNotas = data;

      if (widget.listanotaServicio.length == 0) {
        widget.jSonNotas = '[{"codigoNota": 0,"calificacion": 0.0}]';
      }
    });

    return "Procesado";
  }

  @override
  Widget build(BuildContext context) {
    //VARIABLE QUE DECODIFICA LA CADENA TIPO STRING EN UN OBJETO JSON
    var json = jsonDecode(widget.jSonAlumnos);
    var jsonnota = jsonDecode(widget.jSonNotas);
    return Scaffold(
      appBar: AppBar(title: Text("Hola: " + widget.correo)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("Consulta de mis alumnos",
                  style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
            ),
            JsonTable(
              json,

              //seleccionar celdas
              showColumnToggle: true,
              allowRowHighlight: true,
              rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
              paginationRowCount: 10,
              onRowSelect: (index, map) {
                widget.codigoServicioSeleccionado =
                    int.parse(map["CodigoAlumno"].toString());
                print("demo" + map["CodigoAlumno"].toString());
              },
            ),
            JsonTable(
              jsonnota,

              //seleccionar celdas
              showColumnToggle: true,
              allowRowHighlight: true,
              rowHighlightColor: Colors.yellow[500].withOpacity(0.7),
              paginationRowCount: 10,
              onRowSelect: (index, map) {
                widget.codigoServicioSeleccionado =
                    int.parse(map["CodigoAlumno"].toString());
                print("demo" + map["CodigoAlumno"].toString());
              },
            )
          ],
        ),
      ),
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

                _consultarServiciosNotas();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ver Alumnos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _consultarServiciosAlumnos();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cerrar Sesion'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(title: "Inicio de Sesion");
                }));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
