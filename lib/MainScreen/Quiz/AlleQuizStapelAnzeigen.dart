import 'package:flutter/material.dart';
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
  Map<String, Stapel> buttons= alleStapel();

  static Map<String, Stapel> alleStapel () {
    Map<String, Stapel> stapelverzeichnis = new Map();
    for (int i = 0; i < userdata.stapel.length; i++) {
      String kursname = userdata.stapel[i].getStudienfachName();
      String themengebiet = userdata.stapel[i].getThemengebietName();

      stapelverzeichnis[kursname + "\n" + themengebiet]= userdata.stapel[i];
      print(userdata.stapel[i].getThemengebietName());
    }

    return stapelverzeichnis;
  }


  @override
  Widget build(BuildContext context) {

    var _userdata = new Userdata();


    var  verfuegbareStapel = _userdata.stapel.length;

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

                  Navigator.pushNamed(context, 'Quizstart');
                },
              );
            }
        )
    );
  }
}