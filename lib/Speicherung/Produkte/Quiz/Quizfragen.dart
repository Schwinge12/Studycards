class Quizfragen {

  int id;
  String frage;
  String antwort1;
  int bool1;
  String antwort2;
  int bool2;
  String antwort3;
  int bool3;
  String antwort4;
  int bool4;

  Quizfragen();

  static Future<Quizfragen> QFfromMapObject(Map<String, dynamic> map) async {
    Quizfragen qf = new Quizfragen();
    qf.id = map['id'];
    qf.frage = map['frage'];
    qf.antwort1 = map['antwort1'];
    qf.bool1 = map['bool1'];
    qf.antwort2 = map['antwort2'];
    qf.bool2 = map['bool2'];
    qf.antwort3 = map['antwort3'];
    qf.bool3 = map['bool3'];
    qf.antwort4 = map['antwort4'];
    qf.bool4 = map['bool4'];

    return qf;
  }

  getAntwort(int index) {
    switch (index) {
      case 1:
        {
          if (antwort1 != null) {
            return antwort1;
          }
          return '';
        }
        break;

      case 2:
        {
          if (antwort2 != null) {
            return antwort2;
          }
          return '';
        }
        break;
      case 3:
        {
          if (antwort3 != null) {
            return antwort3;
          }
          return '';
        }
        break;
      case 4:
        {
          if (antwort4 != null) {
            return antwort4;
          }
          return '';
        }
        break;
      default:
        {
          return '';
        }
    }
  }
}