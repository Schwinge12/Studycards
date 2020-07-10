import 'dart:io';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/MainScreen/Karten/KarteErstellenVorderseite.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelAbschliessen.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Karteikarte.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';


class KarteErstellenRueckseite extends StatefulWidget {

  KarteErstellenRueckseite({this.vorderSeite,this.stapel});
  Stapel stapel;
  final KarteErstellenVorderseite vorderSeite;
  final Userdata _userdata = new Userdata();



  final TextEditingController vorderseite = new TextEditingController();
  String eingabe;

  String get getEingabe => eingabe;

  @override
  _KarteErstellenRueckseite createState() => _KarteErstellenRueckseite();
}


class _KarteErstellenRueckseite extends State<KarteErstellenRueckseite> {
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
        title: Center(child:
        AutoSizeText(widget.vorderSeite.studienfach+': '+widget.vorderSeite.themengebiet,
          minFontSize: 6,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        ),
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
                      karteikarteEinfuegen();

                      Navigator.push(context,MaterialPageRoute(builder: (context)=>StapelAbschliessenDozent(stapel: widget.stapel,)));
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
                    controller: widget.vorderseite,
                    maxLines: 20,
                    onChanged: (String s){
                      widget.eingabe=s;
                    },
                  ),
                ),

              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: new Center(child: _imageFile == null ? new Text("Um ein Bild einzufügen drücken\n         Sie auf die Kamera") : new Image.file(_imageFile, width: 400, height: 400))
                )
              ),

              Row(
                children: <Widget>[
              Expanded(
                child: FlatButton(onPressed: (){
                  auswaehlen(context);
                  }, child: Icon(Icons.add_a_photo, size: 60, color: Colors.white30)
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

                       karteikarteEinfuegen();


                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenVorderseite(studiengang: widget.vorderSeite.studiengang,studienfach: widget.vorderSeite.studienfach,themengebiet: widget.vorderSeite.themengebiet,stapel: widget.stapel,)));
                      },
                    ),
                  ),

                ],
              ),
            ]),
      ),
    );
  }

  void karteikarteEinfuegen(){

    Karteikarte kk =  new Karteikarte()
        .mitVorderSeite(widget.vorderSeite.getEingabe.toString())
        .mitRueckSeite(widget.eingabe.toString())
        .mitThemengebiet(widget.stapel.getThemengebietName());
   if(widget.vorderSeite.imageFile != null)
     kk.mitFile(widget.vorderSeite.imageFile);
    if(_imageFile != null )
      kk.mitFile(_imageFile);

  print(widget.stapel.stapelKarten.length.toString());
    widget.stapel.stapelKarten.add(kk);
  }

}