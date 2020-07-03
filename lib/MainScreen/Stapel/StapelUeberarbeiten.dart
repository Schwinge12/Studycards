import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankKarteikarten.dart';
import 'package:swipe_stack/swipe_stack.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';
import 'package:image_picker/image_picker.dart';


class StapelUeberarbeiten extends StatefulWidget {

  Stapel stapel;
  int kartennummer = 0;

  StapelUeberarbeiten({@required this.stapel});

  TextEditingController vorderseite= new TextEditingController();
  TextEditingController rueckseite= new TextEditingController();

  @override
  _StapelUeberarbeitenState createState() => _StapelUeberarbeitenState();
}

class _StapelUeberarbeitenState extends State<StapelUeberarbeiten> {


  Future<void> auswaehlenVorderseite(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Auswählen"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galerie"),
                onTap: () {
                  _openGalleryVorderseite();
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Kamera"),
                onTap: () {
                  _openCameraVorderseite();
                },
              )
            ],
          ),
        ),
      );
    });
  }
  Future _openGalleryVorderseite() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      widget.stapel.stapelKarten[widget.kartennummer].mitFileSpeichern(image);
    });
    Navigator.of(context).pop();
  }

  Future _openCameraVorderseite() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      widget.stapel.stapelKarten[widget.kartennummer].mitFileSpeichern(image);
    });
    Navigator.of(context).pop();
  }


  Future<void> auswaehlenRueckseite(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Auswählen"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galerie"),
                onTap: () {
                  _openGalleryRueckseite();
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Kamera"),
                onTap: () {
                  _openCameraRueckseite();
                },
              )
            ],
          ),
        ),
      );
    });
  }

  Future _openGalleryRueckseite() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      widget.stapel.stapelKarten[widget.kartennummer].mitFileSpeichern(image);
    });
    Navigator.of(context).pop();
  }

  Future _openCameraRueckseite() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      widget.stapel.stapelKarten[widget.kartennummer].mitFileSpeichern(image);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text( widget.stapel.getThemengebietName())),
            actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(Icons.arrow_back,color: Colors.white, size: 40),
                onPressed: (){
                  LokaleDatenbankKarteiKarten.updateKk(widget.stapel.stapelKarten[widget.kartennummer]);
                  if(-1 == widget.kartennummer-1)
                    Navigator.pop(context, 'StapelAbschliessenDozent');
                  else setState(() {
                    widget.kartennummer  -- ;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.save,color: Colors.white, size: 40),
                tooltip: 'Stapel abschließen und hochladen',
                onPressed: (){
                  LokaleDatenbankKarteiKarten.updateKk(widget.stapel.stapelKarten[widget.kartennummer]);
                  Navigator.pop(context, 'StapelAbschliessenDozent');
                },
              ),
              IconButton(
                icon: Icon(Icons.check_box,color: Colors.white, size: 40),
                onPressed: (){
                  LokaleDatenbankKarteiKarten.updateKk(widget.stapel.stapelKarten[widget.kartennummer]);
                  if(widget.stapel.stapelKarten.length-1 == widget.kartennummer)
                    Navigator.pop(context, 'StapelAbschliessenDozent');
                  else setState(() {
                    widget.kartennummer  ++ ;
                  });
                },
              )
            ]
        ),
             body: SafeArea(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Card(
                                elevation: 0.0,
                                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                                color: Colors.white,
                                child: FlipCard(
                                  direction: FlipDirection.HORIZONTAL,
                                  speed: 500,
                                  onFlipDone: (status) {
                                    print(status);
                                  },
                                  front: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          child: SafeArea(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Aktueller Text:',style:KleinereAnzeigeTextStyle),
                                                Text(widget.stapel.stapelKarten[widget.kartennummer].getVorderSeite()+'\n', style: MenuButtonTextStyle),
                                                Text('Neuer Text:',style:KleinereAnzeigeTextStyle),
                                                TextField(
                                                  style: KleinereAnzeigeTextStyle,
                                                  controller: widget.vorderseite,
                                                  maxLines: 10,
                                                  onChanged: (String s){
                                                    widget.stapel.stapelKarten[widget.kartennummer].mitVorderSeite(s);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Aktuelles Bild:"),
                                              Expanded(
                                                child: Container(
                                                    color: Colors.white,
                                                    child:
                                                    SafeArea(
                                                      child: new Center(child: widget.stapel.stapelKarten[widget.kartennummer].bilder.length == 0
                                                          ? new Text("Kein Bild vorhanden.")
                                                          : new Image.file(widget.stapel.stapelKarten[widget.kartennummer].bilder[0], width: 400, height: 400)),
                                                    )
                                                ),
                                              ),
                                              Text("Neues Bild:"),
                                              FlatButton(onPressed: (){
                                                auswaehlenVorderseite(context);
                                              },child: Icon(Icons.add_a_photo, size: 60, color: Colors.black12)
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  back: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text('Aktueller Text:'),
                                              Text(widget.stapel.stapelKarten[widget.kartennummer].getRueckSeite(), style: MenuButtonTextStyle),
                                              Text('Neuer Text:'),
                                              TextField(
                                                style: MenuButtonTextStyle,
                                                controller: widget.rueckseite,
                                                maxLines: 20,
                                                onChanged: (String ss){
                                                  widget.stapel.stapelKarten[widget.kartennummer].mitRueckSeite(ss);
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                    color: Colors.white,
                                                    child: new Center(child: widget.stapel.stapelKarten[widget.kartennummer].bilder.length < 2
                                                        ? new Text("Kein Bild vorhanden.")
                                                        : new Image.file(widget.stapel.stapelKarten[widget.kartennummer].bilder[0], width: 400, height: 400))
                                                ),
                                              ),
                                              Text("Neues Bild:"),
                                              FlatButton(onPressed: (){
                                                auswaehlenRueckseite(context);
                                              },child: Icon(Icons.add_a_photo, size: 60, color: Colors.black12)
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    )
                ),
    );
  }
}