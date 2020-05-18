import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';

class MCFertigstellen extends StatefulWidget{

  final String studiengang;
  final String studienfach;
  final String themengebiet;

  final String frage;
  final String antwort1;
  final String antwort2;
  final String antwort3;
  final String antwort4;

  MCFertigstellen({this.studiengang,this.studienfach,this.themengebiet,this.frage,this.antwort1,this.antwort2,this.antwort3,this.antwort4});




  @override
  _MCFertigstellen createState()=>_MCFertigstellen();
}


class _MCFertigstellen  extends State<MCFertigstellen> {

  bool checked1=false;
  bool checked2=false;
  bool checked3=false;
  bool checked4=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultipleChoice Abschiessen'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SafeArea(
            child: SizedBox(
              height: 20,
            ),
          ),
          
          Expanded(
            flex: 2,
            child: Text('${widget.frage}',style: WeisserTextStyle,),
          ),

          Expanded(

            child: Row( 
              children: <Widget>[

                Expanded(child: Text('${widget.antwort1}')),
                Checkbox(
                  checkColor: Colors.green,
                  value: checked1,
                  onChanged: (bool value){
                    setState(() {
                      checked1=value;
                    });
                  },
                ),
              ],
            ),
          ),

          Expanded(

            child: Row( 
              children: <Widget>[

                Expanded(child: Text('${widget.antwort2}')),
                Checkbox(
                  checkColor: Colors.green,
                  value: checked2,
                  onChanged: (bool value){
                    setState(() {
                      checked2=value;
                    });
                  },
                ),
              ],
            ),
          ),


          Expanded(

            child: Row( 
              children: <Widget>[

                Expanded(child: Text('${widget.antwort3}')), 
                Checkbox(
                  checkColor: Colors.green,
                  value: checked3,
                  onChanged: (bool value){
                    setState(() {
                      checked3=value;
                    });
                  },
                ),
              ],
            ),
          ),


          Expanded(

            child: Row(

              children: <Widget>[

                Expanded(child: Text('${widget.antwort4}')),
                Checkbox(
                  checkColor: Colors.green,
                  value: checked4,
                  onChanged: (bool value){
                    setState(() {
                      checked4=value;
                    });
                  },
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: SafeArea(
              child: WeiterButton(
                text: 'Erstellen',
                onPress: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>
                      KarteErstellenVorderseite(studiengang: widget.studiengang,studienfach: widget.studienfach,themengebiet: widget.themengebiet,)));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}