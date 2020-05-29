import 'package:flutter/material.dart';
import 'Dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MultipleChoiceButton.dart';
import 'package:karteikartenapp/DozentScreens/MCErstellen.dart';


//TODO Frontend: Löschen Button einfuegen

class KarteErstellenVorderseite extends StatefulWidget {
  final String studiengang;
  final String studienfach;
  final String themengebiet;


  KarteErstellenVorderseite({this.studiengang,this.studienfach,this.themengebiet});

  final TextEditingController vorderseite= new TextEditingController();
  String eingabe;

  String get getEingabe => eingabe;

  @override
  _KarteErstellenVorderseite createState() => _KarteErstellenVorderseite();
}

class _KarteErstellenVorderseite  extends State<KarteErstellenVorderseite> {
  File _imageFile;

  Future _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      _imageFile=image;
    });
    Navigator.of(context).pop();
  }

  Future _openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _imageFile=image;
    });
    Navigator.of(context).pop();
  }

  Future<void> auswaehlen(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Auswählen"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galerie"),
                onTap: () {
                  _openGallery();
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Kamera"),
                onTap: () {
                  _openCamera();
                },
              )
            ],
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO FrontEnd: Lange Strings passend anzeigen
        title: Text(widget.studienfach+': '+widget.themengebiet),

      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text('VORDERSEITE:\n',style: WeisserTextStyle,)),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    style: MenuButtonTextStyle,
                    controller: widget.vorderseite,
                    maxLines: 20,
                    onChanged: (String s){
                      widget.eingabe=s;
                    },
                  )
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: new Center(child: _imageFile == null ? new Text("Um ein Bild einzufügen drücken\n         Sie auf die Kamera") : new Image.file(_imageFile, width: 400, height: 400))
                ),
              ),

              Row(

                children: <Widget>[

                  Expanded(
                    child: FlatButton(onPressed: (){
                      auswaehlen(context);
                    },child: Icon(Icons.add_a_photo, size: 60, color: Colors.white30)
                    )
                  ),
                  Expanded(
                      child: MultipleChoiceButton(
                        onPress:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>MCErstellen(studienfach: widget.studienfach,studiengang: widget.studiengang,themengebiet: widget.themengebiet,)));
                        },
                        text: 'MC',
                      )
                  ),

                  Expanded(
                    child: WeiterButton(
                      text: 'Weiter',
                      onPress: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenRueckseite(vorderSeite: this.widget,)));
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







