import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegistroNotasPage extends StatefulWidget {
  RegistroNotasPage({Key key, this.title}) : super(key: key);

  String nombres;
  String curso;
  double nota1;
  double nota2;

  double promedio = 0;
  double descuento = 0;
  double totalapagar = 0;

  bool validacion = false;
  int delivery = 0;
  bool validaciondelivery = false;
  bool defaultvalue = false;
  String mensaje;
  String estado;

  double total;

  final String title;

  @override
  _RegistroNotasPageState createState() => _RegistroNotasPageState();
}

class _RegistroNotasPageState extends State<RegistroNotasPage> {
  final _tfNombres = TextEditingController();
  final _tfCurso = TextEditingController();
  final _tfNota1 = TextEditingController();
  final _tfNota2 = TextEditingController();
  final _tfNota3 = TextEditingController();
  final _tfNota4 = TextEditingController();

  double _calcularPromedio() {
    setState(() {
      widget.total = double.parse(_tfNota1.text.toString()) +
          double.parse(_tfNota2.text.toString()) +
          double.parse(_tfNota3.text.toString()) +
          double.parse(_tfNota4.text.toString());

      return widget.promedio = widget.total / 4;
    });
    return widget.promedio;
  }

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
                    controller: _tfNombres,
                    decoration: InputDecoration(
                      hintText: "Ingrese el nombre",
                      labelText: "Nombres",
                    ),
                  ),
                  TextField(
                      controller: _tfCurso,
                      decoration: InputDecoration(
                        hintText: "Ingrese el curso",
                        labelText: "Curso",
                      )),
                  TextField(
                      controller: _tfNota1,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "Ingrese Nota1",
                        labelText: "Nota1",
                        errorText: _tfNota1.text.toString() == ""
                            ? widget.mensaje
                            : null,
                      )),
                  TextField(
                      controller: _tfNota2,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "Ingrese Nota2",
                        labelText: "Nota2",
                        errorText: _tfNota2.text.toString() == ""
                            ? widget.mensaje
                            : null,
                      )),
                  TextField(
                      controller: _tfNota3,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "Ingrese Nota3",
                        labelText: "Nota3",
                        errorText: _tfNota3.text.toString() == ""
                            ? widget.mensaje
                            : null,
                      )),
                  TextField(
                      controller: _tfNota4,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "Ingrese Nota4",
                        labelText: "Nota4",
                        errorText: _tfNota4.text.toString() == ""
                            ? widget.mensaje
                            : null,
                      )),
                  Text(
                    "Estado: " + widget.estado.toString(),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    "Promedio: " + widget.promedio.toString(),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  RaisedButton(
                    onPressed: _calcularPromedio,
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
