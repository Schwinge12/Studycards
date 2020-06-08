import 'package:flutter/material.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';


class AlleStapel extends StatefulWidget{

  @override
  _AlleStapel createState()=>_AlleStapel();

}


class _AlleStapel extends State<AlleStapel> {

  static Userdata userdata = new Userdata();
  List<String> buttons= alleStapel();

  static List<String> alleStapel () {
    List<String> stapelverzeichnis = new List();
    for (int i = 0; i < userdata.kurse.length; i++) {
      String kursname = userdata.kurse[i].name;
      for (int t = 0; t < userdata.kurse[i].themengebiet.length; t++){
        String themengebiet = userdata.kurse[i].themengebiet[t].name;


      stapelverzeichnis.add(kursname + "\n" + themengebiet);
      }
    }

    return stapelverzeichnis;
  }


  @override
  Widget build(BuildContext context) {

    var _userdata = new Userdata();


    var  verfuegbareStapel = _userdata.stapel.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meine angelegten Stapel',style: WeisserTextStyle,),
      ),
      body: new ListView.builder(
        itemCount: buttons.length,
        itemBuilder: (BuildContext contex,index){
          return MenuButton(
            text: buttons[index],
            onPress: (){
              Navigator.pushNamed(context, 'EinzelnerStapelStatus');
            },
          );
        }
      )
    );
  }

}