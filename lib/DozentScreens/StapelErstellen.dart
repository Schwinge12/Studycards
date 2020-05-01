import 'package:flutter/material.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';
import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';




//TODO Backend: Eingebene Daten abspeichern

class StapelErstellen extends StatefulWidget{

  @override
  _StapelErstellen createState()=>_StapelErstellen();
}
class _StapelErstellen extends State<StapelErstellen> {

  final TextEditingController studiengang= new TextEditingController();
  String studiengangstring;
  final TextEditingController studienfach= new TextEditingController();
  String studienfachstring;
  final TextEditingController themengebiet= new TextEditingController();
  String themengebietstring;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],

      ),
      body: Column(
        children: <Widget>[

          Expanded(

            child: TextField(
              onChanged: (String s){
                studiengangstring=s;
              },
              style: TextStyle(color: Colors.black),
              cursorColor:Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Studiengang eingeben:',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          SizedBox(
            height: 10.0,
          ),

          Expanded(

            child: TextField(
              onChanged: (String s){
                studienfachstring=s;
              },
              style: TextStyle(color: Colors.black),
              cursorColor:Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Studienfach eingeben:',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          SizedBox(
            height: 10.0,
          ),

          Expanded(

            child: TextField(
              onChanged: (String s){
                themengebietstring=s;
              },
              style: TextStyle(color: Colors.black),
              cursorColor:Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Themengebiet eingeben:',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),



          Row(
            children: <Widget>[



              Expanded(
                  child: WeiterButton(
                    text: 'Speichern',
                    onPress: (){
                      if(studienfachstring==null||studiengangstring==null||themengebietstring==null){


                        showDialog(context: context,
                            builder: (_)=>CupertinoAlertDialog(
                              title: Text('Fehlende eingaben!'),
                              content: Text('Bitte jede Zeile füllen.'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: Text('OK'),
                                  onPressed:
                                      (){
                                    Navigator.pop(context);
                                  },
                                ),

                              ],
                            ),
                            barrierDismissible: false);
                      }
                      else{
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenVorderseite(studiengang: studiengangstring,studienfach: studienfachstring,themengebiet: themengebietstring)));
                      }

                    },
                  )
              ),
            ],
          )



        ],
      ),
    );
  }
}