import 'package:karteikartenapp/Speicherung/Produkt.dart';
import 'Quizfragen.dart';

class QuizNeu extends Produkt{

  int id;
  String studienfach;
  String themengebiet;

  var map = Map<String, dynamic> ();

  List<Quizfragen> fragenliste=new List();

  QuizNeu();

  add(Quizfragen q){fragenliste.add(q);} // convienice

  static QuizNeu QuizfromMapObject(Map<String, dynamic> map) {
    QuizNeu s = new QuizNeu();
    s.id = map['_id'];
    s.studienfach =map['studienfach'];
    s.themengebiet = map['themengebiet'];
    return s;
  }

}