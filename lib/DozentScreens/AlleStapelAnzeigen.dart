import 'package:flutter/material.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';


class AlleStapel extends StatefulWidget{

  @override
  _AlleStapel createState()=>_AlleStapel();

}


class _AlleStapel extends State<AlleStapel> {


  @override
  Widget build(BuildContext context) {

    Userdata _userdata = new Userdata();
    var  verfuegbareStapel = _userdata.stapel.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meine angelegten Stapel',style: WeisserTextStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Center(
              child: MenuButton(
                text: 'Stapelname\nThemengebiet',
                onPress: (){
                  Navigator.pushNamed(context, 'EinzelnerStapelStatus');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}