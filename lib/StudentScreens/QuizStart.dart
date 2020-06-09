
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';


class QuizStart extends StatefulWidget{

  @override
  _QuizStartState createState()=>_QuizStartState();
}

class _QuizStartState extends State<QuizStart>{


  int anzahlKartenImStapel=10;
  int auswahl=5;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Stapelname,Thema',style: WeisserTextStyle,)),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                10.0, // horizontal, move right 10
                10.0, // vertical, move down 10
              ),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(

          children: <Widget>[
            //TODO Backend: Anzahl der Karten einfügen
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text('Anzahl Quizfragen',style: MenuButtonTextStyle,),
                ),
              ),
            ),

            Text(auswahl.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),

            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.red,
                  thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape:
                  RoundSliderOverlayShape(overlayRadius: 20.0),
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                ),
                child: Slider(
                  value: auswahl.toDouble(),
                  min: 1.0,
                  max: anzahlKartenImStapel.toDouble(),
                  onChanged: (double newValue) {
                    setState(() {
                      auswahl = newValue.round();
                    });
                  },
                ),
              ),
            ),


            Expanded(
              child: WeiterButton(
                color: Colors.green,
                style: WeisserTextStyle,
                text: 'Quiz starten!',
                onPress: (){
                  Navigator.pushNamed(context, 'Quiz');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}