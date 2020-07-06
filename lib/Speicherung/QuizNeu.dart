import 'package:karteikartenapp/Speicherung/Produkt.dart';
import 'Quizfragen.dart';

class QuizNeu extends Produkt{

  int id;
  String studienfach;
  String themengebiet;

  var map = Map<String, dynamic> ();

  List<Quizfragen> fragenliste=new List();

  QuizNeu();

  add(Quizfragen q){fragenliste.add(q);}

  String getThemengebiet(){
    if (themengebiet != null) {
      return themengebiet;
    }
    return '404';
  }
  String getStudienfach(){
    if (studienfach != null) {
      return studienfach;
    }
    return '404';
  }



  static QuizNeu QuizfromMapObject(Map<String, dynamic> map) {
    QuizNeu s = new QuizNeu();
    s.id = map['_id'];
    s.studienfach =map['studienfach'];
    s.themengebiet = map['themengebiet'];
    return s;
  }

}