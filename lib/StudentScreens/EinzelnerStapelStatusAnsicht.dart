import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/ErfolgsAnzeige.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/DozentScreens/AlleStapelAnzeigen.dart';
import 'package:karteikartenapp/DozentScreens/Kartenabfrage.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankStapel.dart';

class StapelStatus extends StatefulWidget{

  Stapel stapel;

  StapelStatus({@required this.stapel});


  @override
  StapelStatusState createState()=>StapelStatusState();
}

class StapelStatusState extends State<StapelStatus>{
  final dbHelfer = LokaleDatenbankStapel.instance;

  StapelStatusState(){}

  Userdata userdata;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text( widget.stapel.getStudienfachName())),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 35),
              onPressed: (){
                _loeschen();

              },

            ),
          ]
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

            Expanded(
              child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Anzahl der Karten:'+widget.stapel.stapelKarten.length.toString(),
                  style: TextStyle(fontFamily: 'BalooBhai2-ExtraBold',
                  fontSize: 25.0
                  ),
                ),
              ),
              ),
            ),
            Expanded(
              child: Center(child:
              Text('Aktueller Lernfortschritt:',
                style: TextStyle(fontFamily:'BalooBhai2-ExtraBold',
                    fontSize: 25.0
                ),
              ),
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Kartenabfrage(stapel: widget.stapel)));
                  //Todo Frontend Staple an Kartenabfrage übergeben
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _loeschen() async{
    LokaleDatenbankStapel.stapelLoeschen(userdata.stapel.indexOf(widget.stapel));
    print(userdata.stapel.indexOf(widget.stapel));
  }
}