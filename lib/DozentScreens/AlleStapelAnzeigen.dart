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

  Userdata userdata = new Userdata();

  List<MenuButton> alleStapel (){

    List<MenuButton> stapelverzeichnis=[];
    for(int i =0;i<20/*userdata.kurse.length*/;i++){
      String kursname= 'test';//userdata.kurse[i].name;
      String themengebiet= 'test';//userdata.stapel[i].name;

      var newItem=MenuButton(
        text: kursname+"\n"+themengebiet,

      );

      stapelverzeichnis.add(newItem);
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
        itemCount: alleStapel().length,
        itemBuilder: (BuildContext contex,index){
          return MenuButton(
            text: "Test",
            onPress: (){
              Navigator.pushNamed(context, 'EinzelnerStapelStatus');
            },
          );
        }
      )
    );
  }

}