import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelUeberarbeiten.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankStapel.dart';
import 'package:karteikartenapp/Speicherung/FileManager.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../../ButtonsAndConstants/TextStyles.dart';
import '../../ButtonsAndConstants/MenuButton.dart';

class StapelAbschliessen extends StatelessWidget {

  StapelAbschliessen({this.kurse,this.stapel});
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
               SafeArea(
                 child: MenuButton(
                  text: 'Stapel speichern',
                  onPress: () async {
                    //set id
                     await bilderSpeichern();
                     LokaleDatenbankStapel.insertStapel(stapel);
                    Stapel tmpStapel  = await LokaleDatenbankStapel.lastEntry();
                    //kopiere / speichere - stapel/ kk / bilder

                    _u.einfuegen(tmpStapel);
                    // debugAusgabe(stapel, tmpStapel);
                  Navigator.pushNamed(context, 'MenuPage');
                  },
              ),
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
  void bilderSpeichern() async{
    for (int i = 0; i < stapel.stapelKarten.length ; i++) {
      for (int t = 0; t < stapel.stapelKarten[i].bilder.length; t++) {
        print('Speichere bild : ' + t.toString());
        FileManager.writeFile(
            stapel.getThemengebietName(), i + 1, stapel.stapelKarten[i].bilder[t],
            t); // DB beginnt bei id= 1 -> i+1
      }
    }
  }

}
void debugAusgabe(Stapel s1, Stapel s2){
  print(s1.stapelKarten.length.toString() + ' Karten in Stapel 1');
  print(s2.stapelKarten.length.toString() + ' Karten in Stapel 2');
  for( int i = 0 ; i < s1.stapelKarten.length; i++){
    print(s1.stapelKarten[i].bilder.length.toString() + ' : Stapel_1_[$i].bilder.length');
  }
  for( int i = 0 ; i < s2.stapelKarten.length; i++){
    print(s2.stapelKarten[i].bilder.length.toString() + ' : Stapel_2_[$i].bilder.length');
  }
}

