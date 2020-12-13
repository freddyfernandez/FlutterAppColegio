import 'dart:convert';

import 'package:built_value/json_object.dart';

class NotaServicio {
  int CodigoNota;
  double Calificacion;

  void inicializar() {
    this.CodigoNota = 0;
    this.Calificacion = 0.0;
  }

  NotaServicio({
    this.CodigoNota,
    this.Calificacion,
  });

  factory NotaServicio.fromJson(Map<String, dynamic> json) {
    return NotaServicio(
        CodigoNota: json["codigoNota"], Calificacion: json["calificacion"]);
  }
}
