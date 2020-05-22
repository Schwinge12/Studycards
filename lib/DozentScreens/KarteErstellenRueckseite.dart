import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';
import 'package:karteikartenapp/Speicherung/Karteikarte.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';



class KarteErstellenRueckseite extends StatelessWidget {

  KarteErstellenRueckseite({this.vorderSeite});

  final KarteErstellenVorderseite vorderSeite;
  final Userdata _userdata = new Userdata();

  final TextEditingController vorderseite = new TextEditingController();
  String eingabe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vorderSeite.studienfach+': '+vorderSeite.themengebiet),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text('Rückseite:',style: WeisserTextStyle,)),
                  FlatButton(

                    onPressed: (
                        ){
                    //Karte wird eingefügt______________________________________________________
                        _userdata.einfuegen(
                            new Karteikarte()
                            .mitKurs(_userdata.getKursMitString(vorderSeite.studienfach))
                            .mitStudiengang(_userdata.getStudiengangMitString(vorderSeite.studiengang))
                            .mitVorderSeite(vorderSeite.eingabe)
                            .mitRueckSeite(eingabe)
                        );
                        Navigator.pushNamed(context, 'StapelAbschliessenDozent');
                        },
                    child: Container(
                      width: 100,
                      height: 30,
                      color: Colors.white30,
                      child: Center(child: Text('Fertig',style:
                        TextStyle(color: Colors.black,fontFamily: 'Baloobhai2-ExtraBold.ttf', fontSize: 16.0 ) ,
                      )),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    style: MenuButtonTextStyle,
                    controller: vorderseite,
                    maxLines: 20,
                    onChanged: (String s){
                      eingabe=s;
                    },
                  ),
                ),

              ),

              Row(
                children: <Widget>[
              Expanded(
                  child: FlatButton(
                  child: Icon (Icons.add_a_photo, size: 60,color: Colors.white30),
                  onPressed: (){
                  //TODO BackEnd: Kamera Zugriff ermöglichen, Datensatz speichern
                  }
                  ),

              ),

                  Expanded(
                    child: Container(
                      width: 170.0,
                    ),
                  ),

                  Expanded(
                    child: WeiterButton(
                      text: 'Weiter',
                      onPress: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),

                ],
              ),
            ]),
      ),
    );
  }
}