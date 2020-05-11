import 'package:flutter/material.dart';
import '../ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';


class QuizAuswahl extends StatefulWidget{

  @override
  _AlleStapel createState()=>_AlleStapel();

}


class _AlleStapel extends State<QuizAuswahl> {


  @override
  Widget build(BuildContext context) {

    //TODO Frontend:so viele MenuButtons erzeugen wie es Stapel gibt (List <Stapel> : userdata.stapel) - stapel.length
    //TODO Frontend: möglichkeit finden Userdata 1 mal anzulegen und dann in alle benötigten klassen zu übergeben

    return Scaffold(
      appBar: AppBar(
        title: Text('Meine angelegten Stapel',style: WeisserTextStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Center(
              child: MenuButton(
                text: 'Stapelname\nThemengebiet',
                onPress: (){
                  Navigator.pushNamed(context, 'Quizstart');
                },
              ),
            ),









          ],
        ),
      ),
    );
  }

}