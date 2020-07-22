import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankKarteikarten.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Stapel.dart';
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



  Future<void> auswaehlenBild(BuildContext context, int seite) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Auswählen"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galerie"),
                onTap: () {
                  _openGallery(seite);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Kamera"),
                onTap: () {
                  _openCamera(seite);
                },
              )
            ],
          ),
        ),
      );
    });
  }

  Future _openGallery(int seite) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      widget.stapel.stapelKarten[widget.kartennummer].bilder[seite] = image;
    });
    Navigator.of(context).pop();
  }

  Future _openCamera(int seite) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      widget.stapel.stapelKarten[widget.kartennummer].bilder[seite] = image;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: AutoSizeText(
              widget.stapel.getThemengebietName(),
              minFontSize: 6,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            ),
            actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(Icons.arrow_back,color: Colors.white, size: 30),
                onPressed: (){
                  if(-1 == widget.kartennummer-1)
                    Navigator.pop(context, 'StapelAbschliessenDozent');
                  else setState(() {
                    widget.kartennummer  -- ;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.save,color: Colors.grey, size: 30),
                tooltip: 'Stapel abschließen und hochladen',
                onPressed: (){

                  Navigator.pop(context, 'StapelAbschliessenDozent');
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward,color: Colors.white, size: 30),
                onPressed: (){
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

                                  front: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white38,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          child: SafeArea(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                AutoSizeText(
                                                  ('Aktueller Text:'' \n'+widget.stapel.stapelKarten[widget.kartennummer].getVorderSeite()),
                                                  textAlign: TextAlign.center,
                                                  style: KleinereAnzeigeTextStyle,
                                                  minFontSize: 6,
                                                  maxLines: 6,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                SizedBox(
                                                  height: 15.0,
                                                ),
                                                TextFormField(
                                                  obscureText: false,
                                                  textAlign: TextAlign.center,
                                                  onChanged: (String s){
                                                    widget.stapel.stapelKarten[widget.kartennummer].mitVorderSeite(s);
                                                  },
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.black38,
                                                    hintText: 'Neuer Text',
                                                    contentPadding:
                                                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: Colors.black, width: 1.0),
                                                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: Colors.black, width: 2.0),
                                                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white38,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          child: SafeArea(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text("Aktuelles Bild:"),
                                                Expanded(
                                                  child: Container(
                                                      color: Colors.black26,
                                                      child:
                                                      new Center(child: widget.stapel.stapelKarten[widget.kartennummer].bilder[0] == null
                                                          ? new Text("Kein Bild vorhanden.")
                                                          : new Image.file(widget.stapel.stapelKarten[widget.kartennummer].bilder[0], width: 400, height: 400))
                                                  ),
                                                ),
                                                FlatButton(onPressed: (){
                                                  auswaehlenBild(context, 0);
                                                },child: Icon(Icons.add_a_photo, size: 60, color: Colors.black26)
                                                )
                                              ],
                                            ),
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
                                              AutoSizeText(
                                                ('Aktueller Text:'' \n'+widget.stapel.stapelKarten[widget.kartennummer].getRueckSeite()),
                                                textAlign: TextAlign.center,
                                                style: KleinereAnzeigeTextStyle,
                                                minFontSize: 6,
                                                maxLines: 6,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextFormField(
                                                obscureText: false,
                                                textAlign: TextAlign.center,
                                                onChanged: (String ss){
                                                  widget.stapel.stapelKarten[widget.kartennummer].mitRueckSeite(ss);
                                                },
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.black26,
                                                  hintText: 'Neuer Text',
                                                  contentPadding:
                                                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.black, width: 1.0),
                                                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.black, width: 2.0),
                                                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                                  ),
                                                ),
                                              ),
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
                                                    color: Colors.black26,
                                                    child: new Center(child: widget.stapel.stapelKarten[widget.kartennummer].bilder[1] == null
                                                        ? new Text("Kein Bild vorhanden.")
                                                        : new Image.file(widget.stapel.stapelKarten[widget.kartennummer].bilder[1], width: 400, height: 400))
                                                ),
                                              ),
                                              Text("Neues Bild:"),
                                              FlatButton(onPressed: (){
                                                auswaehlenBild(context, 1);
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