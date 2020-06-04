import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/ErfolgsAnzeige.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';

class StapelStatus extends StatefulWidget{

  @override
  _StapelStatusState createState()=>_StapelStatusState();
}

class _StapelStatusState extends State<StapelStatus>{

  String stapelname = "Stapelname";
  String themengebiet = "Themengebiet";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text( stapelname+' + '+themengebiet,style: WeisserTextStyle,)),
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
              child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Anzahl der Karten:',style: KleinereAnzeigeTextStyle,),
              ),
              ),
            ),
            Expanded(
              child: Center(child: Text('Aktueller Lernfortschritt:',style: KleinereAnzeigeTextStyle,),
              ),
            ),
            Expanded(
              flex: 7,
              child: ErfolgsAnzeige(
              ),
            ),
            Expanded(
              flex: 2,
              child: WeiterButton(
                color: Colors.green,
                style: WeisserTextStyle,
                text: 'Jetzt Lernen!',
                onPress: (){
                  Navigator.pushNamed(context, 'Kartenabfrage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}