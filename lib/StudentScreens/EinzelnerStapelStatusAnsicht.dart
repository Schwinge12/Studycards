import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/ErfolgsAnzeige.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';

class StapelStatus extends StatefulWidget{
  StapelStatus();
  StapelStatusmitStapel(Stapel s){this.stapel = s;}
  Stapel stapel;

  @override
  StapelStatusState createState()=>StapelStatusState(stapel);
}

class StapelStatusState extends State<StapelStatus>{

  StapelStatusState(Stapel s){this.stapel = s;}


  Stapel stapel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text( stapel.getName()+' + '+stapel.getThemengebietName(),style: WeisserTextStyle,)),
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
            //TODO Frontend: Anzahl der Karten einfügen - stapel.stapelKarten.length;
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