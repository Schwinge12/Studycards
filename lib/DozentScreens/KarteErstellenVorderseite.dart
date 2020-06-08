import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'Dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MultipleChoiceButton.dart';
import 'package:karteikartenapp/DozentScreens/MCErstellen.dart';


class KarteErstellenVorderseite extends StatefulWidget {
  final String studiengang;
  final String studienfach;
  final String themengebiet;
  File imageFile;

  KarteErstellenVorderseite({this.studiengang,this.studienfach,this.themengebiet});

  final TextEditingController vorderseite= new TextEditingController();
  String eingabe;

  String get getEingabe => eingabe;

  @override
  _KarteErstellenVorderseite createState() => _KarteErstellenVorderseite();
}

class _KarteErstellenVorderseite  extends State<KarteErstellenVorderseite> {


  Future _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      widget.imageFile=image;
    });
    Navigator.of(context).pop();
  }

  Future _openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      widget.imageFile=image;
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

      body: Center(
        child: Column(


            children: <Widget>[
              Center(child: Row(

                children: <Widget>[

                  Expanded(
                    child: WeiterButton(
                      text: 'Zurück',
                      onPress: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(

                        child: Column(
                          children: <Widget>[
                            Center(
                              child: AutoSizeText(widget.studienfach, style: MenuButtonTextStyle , maxLines: 1),
                            ),
                            Center(
                              child: AutoSizeText(widget.themengebiet,style: MenuButtonTextStyle , maxLines: 1),
                            )
                          ]
                            ),
                        ),

                  ),
                  Expanded( child: WeiterButton(
                    text: 'Weiter',
                    onPress: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenRueckseite(vorderSeite: this.widget,)));
                    },
                  ),

                  )
                ],

              )),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text('VORDERSEITE'),
                      ),
                      Expanded(
                        child: TextField(
                          style: MenuButtonTextStyle,
                          controller: widget.vorderseite,
                          maxLines: 20,
                          onChanged: (String s){
                            widget.eingabe=s;
                          },
                        ),
                      )
                    ],
                  )

                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: new Center(child: widget.imageFile == null ? new Text("Um ein Bild einzufügen drücken\n         Sie auf die Kamera") : new Image.file(widget.imageFile, width: 400, height: 400))
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
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenVorderseite(studienfach: widget.studienfach,studiengang: widget.studiengang,themengebiet: widget.themengebiet)));
                      }, child: Icon(Icons.delete, size:60, color: Colors.white30)
                    ),
                  ),

                ],
              ),


            ]),
      ),
    );
  }


}







