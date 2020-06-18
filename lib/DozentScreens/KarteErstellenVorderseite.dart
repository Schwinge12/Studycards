import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'Dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MultipleChoiceButton.dart';
import 'package:karteikartenapp/DozentScreens/MCErstellen.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';


class KarteErstellenVorderseite extends StatefulWidget {
  final String studiengang;
  final String studienfach;
  final String themengebiet;
  // Todo Frontend diesen stapel zwischen Vorderseiten / rueckseiten übergeben + in Stapelabschließen / stapel überarbeiten
  Stapel stapel = new Stapel();
  File imageFile;

  KarteErstellenVorderseite({@required this.studiengang,@required this.studienfach,@required this.themengebiet});

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
      appBar: AppBar(

        title: Text(
          widget.studienfach + ': ' + widget.themengebiet
        ),
          actions: <Widget>[
      // action button
      IconButton(
      icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 25),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenRueckseite(vorderSeite: this.widget,stapel: widget.stapel)));
        },

      ),
    ]

      ),


      body: Center(
        child: Column(
            children: <Widget>[

              Expanded(
                child: Container(

                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('VORDERSEITE'),
                        ),
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

              SafeArea(
                child: Row(

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
              ),


            ]),
      ),
    );
  }


}







