import 'package:flutter/material.dart';
import 'package:karteikartenapp/MainScreen/Quiz/QuizStart.dart';
import 'package:karteikartenapp/Speicherung/QuizNeu.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../../ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';

class AlleQuizStapelStapel extends StatefulWidget{
  @override
  _AlleStapel createState()=>_AlleStapel();
}

//TODO Backend: Quizstapel anzeigen
class _AlleStapel extends State<AlleQuizStapelStapel> {

  static Userdata userdata = new Userdata();
  Map<String, QuizNeu> buttons= alleQuizes();

  static Map<String, QuizNeu> alleQuizes () {
    Map<String, QuizNeu> quizverzeichnis = new Map();
    for (int i = 0; i < userdata.quiz.length; i++) {
      String kursname = userdata.quiz[i].getStudienfach();
      String themengebiet = userdata.quiz[i].getThemengebiet();

      quizverzeichnis[kursname + "\n" + themengebiet]= userdata.quiz[i];
      print(userdata.quiz[i].getThemengebiet());
    }

    return quizverzeichnis;
  }


  @override
  Widget build(BuildContext context) {

    var _userdata = new Userdata();


    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pushNamed(context, 'MenuPage');
            },
          ) ,

          title: Text('Meine Quizsammlung',style: WeisserTextStyle,),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context, 'QuizStapelErstellen');
              },
            )
          ],

        ),

        body: new ListView.builder(
            itemCount: buttons.length,
            itemBuilder: (BuildContext contex,index){
              return MenuButton(
                text: buttons.keys.toList()[index],
                onPress: (){

                Navigator.push(context,MaterialPageRoute(builder: (context)=>QuizStart(quiz:buttons.values.toList()[index] )));
                },
              );
            }
        )
    );
  }
}