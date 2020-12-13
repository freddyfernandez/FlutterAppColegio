import 'dart:convert';

class CursoServicio {
  int CodigoCurso;
  String NombreCurso;

  void inicializar() {
    this.CodigoCurso = 0;
    this.NombreCurso = "";
  }

  CursoServicio({
    this.CodigoCurso,
    this.NombreCurso,
  });

  factory CursoServicio.fromJson(Map<String, dynamic> json) {
    return CursoServicio(
        CodigoCurso: json["codigoCurso"], NombreCurso: json["nombreCurso"]);
  }
}
