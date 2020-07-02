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
                  //set id
                  LokaleDatenbankStapel.insertStapel(stapel);
                  Stapel tmpStapel  = await LokaleDatenbankStapel.lastEntry();
                  //kopiere / speichere - stapel/ kk / bilder
                  _u.einfuegen(bilderKopieren(tmpStapel));
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
  Stapel bilderKopieren(Stapel tmpStapel){
    for( int i = 0 ; i < tmpStapel.stapelKarten.length; i++){
        for(int t = 0; t < stapel.stapelKarten[i].bilder.length;t++){
          tmpStapel.stapelKarten[i].mitFileSpeichern(stapel.stapelKarten[i].bilder[t]);
        }
    }
    return tmpStapel;
  }

}