import 'package:flutter/material.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';
import 'MenuButton.dart';
import 'package:karteikartenapp/constants.dart';
import 'package:karteikartenapp/WeiterButton.dart';



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
              style: WeisserTextStyle,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Studiengang eingeben: ',

              ),

            ),
          ),


          Expanded(
            child: TextField(
              onChanged: (String s){
                studienfachstring=s;
              },
              style: WeisserTextStyle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Studienfach eingeben:',
              ),
            ),
          ),



          Expanded(

            child: TextField(
              onChanged: (String s){
                themengebietstring=s;
              },
              style: WeisserTextStyle,
              decoration: InputDecoration(

                labelText: 'Themengebiet eingeben:',
              ),
            ),
          ),


          Row(
            children: <Widget>[



              Expanded(
                  child: WeiterButton(
                    text: 'Speichern',
                    onPress: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenVorderseite(studiengangstring: studiengangstring,studienfachstring: studiengangstring,themengebietstring: themengebietstring)));
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