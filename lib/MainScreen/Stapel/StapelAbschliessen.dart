import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelUeberarbeiten.dart';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankStapel.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../../ButtonsAndConstants/TextStyles.dart';
import '../../ButtonsAndConstants/MenuButton.dart';



class StapelAbschliessenDozent extends StatelessWidget {


  StapelAbschliessenDozent({this.kurse,this.stapel});
  var _userdata = new Userdata();
  Stapel stapel;
  final String kurse;
  Userdata _u = new Userdata();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stapel abschließen'),
      ),
      body: Center(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              //TODO Backend: Stapel hochladen

               Expanded(
                 child: SafeArea(
                   child: Container(
                     height: 200.0,

                     child: Image.asset('images/LogoOhneKreis.PNG'),
                   ),
                 ),
               ),


               Text(_userdata.getKonto().accountName,
                   style: WeisserTextStyle,
               ),


               Text(_userdata.getKonto().toString(),
                   style:WeisserTextStyle
               ),
               SizedBox(
                 height: 50,
               ),
               MenuButton(
                text: 'Stapel speichern',
                onPress: () async {
                  LokaleDatenbankStapel.insertStapel(stapel);
                  stapel  = await LokaleDatenbankStapel.lastEntry();
                  _u.einfuegen(stapel);
                Navigator.pushNamed(context, 'MenuPage');
                },
              ),

              //TODO Backend: Stapel aus DB löschen

              MenuButton(
              text: 'Stapel überarbeiten',
              onPress: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>StapelUeberarbeiten(stapel: stapel)));
                },
    ),
    ]
    ),
    )));
  }
}