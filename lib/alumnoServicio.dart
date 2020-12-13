import 'dart:convert';

class AlumnoServicio {
  int CodigoAlumno;
  String NombreAlumno;
  String CorreoAlumno;
  String GradoAlumno;

  void inicializar() {
    this.CodigoAlumno = 0;
    this.NombreAlumno = "";
    this.CorreoAlumno = "";
    this.GradoAlumno = "";
  }

  AlumnoServicio({
    this.CodigoAlumno,
    this.NombreAlumno,
    this.CorreoAlumno,
    this.GradoAlumno,
  });

  factory AlumnoServicio.fromJson(Map<String, dynamic> json) {
    return AlumnoServicio(
        CodigoAlumno: json["codigoAlumno"],
        NombreAlumno: json["nombreAlumno"],
        CorreoAlumno: json["correoAlumno"],
        GradoAlumno: json["gradoAlumno"]);
  }
}
