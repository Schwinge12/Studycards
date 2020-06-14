import 'package:flutter/material.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import 'package:karteikartenapp/StudentScreens/EinzelnerStapelStatusAnsicht.dart';
import '../ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';


class QuizAuswahl extends StatefulWidget{

  @override
  _QuizAuswahl createState()=>_QuizAuswahl();

}


class _QuizAuswahl extends State<QuizAuswahl> {

  static Userdata userdata = new Userdata();
  Map<String, Stapel> buttons= alleStapel();

  static Map<String, Stapel> alleStapel () {
    Map<String, Stapel> stapelverzeichnis = new Map();
    for (int i = 0; i < userdata.stapel.length; i++) {
      String kursname = userdata.stapel[i].getKursName();
      String themengebiet = userdata.stapel[i].getThemengebietName();


      stapelverzeichnis[kursname + "\n" + themengebiet]= userdata.stapel[i];

    }

    return stapelverzeichnis;
  }


  @override
  Widget build(BuildContext context) {

    var _userdata = new Userdata();


    var  verfuegbareStapel = _userdata.stapel.length;

    return Scaffold(
        appBar: AppBar(
          title: Text('Meine Stapel',style: WeisserTextStyle,),
        ),
        body: new ListView.builder(
            itemCount: buttons.length,
            itemBuilder: (BuildContext contex,index){
              return MenuButton(
                text: buttons.keys.toList()[index],
                onPress: (){
                  Navigator.pushNamed(context,'Quizstart');
                },
              );
            }
        )
    );
  }

}