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
    return SwipeStack(
      children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12].map((int index) {
        return SwiperItem(
            builder: (SwiperPosition position, double progress) {
              return Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              color: Colors.white70,
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
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(widget.stapel.getThemengebietName(), style: MenuButtonTextStyle),
                                            Text('Aktueller Text:'),
                                            Text(widget.stapel.stapelKarten[widget.kartennummer].getVorderSeite(), style: MenuButtonTextStyle),
                                            Text('Neuer Text:'),
                                            TextField(
                                              style: MenuButtonTextStyle,
                                              controller: widget.vorderseite,
                                              maxLines: 20,
                                              onChanged: (String s){
                                                widget.stapel.stapelKarten[widget.kartennummer].mitVorderSeite(s);
                                              },
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
                                            Text("Aktuelles Bild:"),
                                            Expanded(
                                              child: Container(
                                                  color: Colors.white,
                                                  child:
                                                  new Center(child: widget.stapel.stapelKarten[widget.kartennummer].bilder.length == 0
                                                      ? new Text("Kein Bild vorhanden.")
                                                      : new Image.file(widget.stapel.stapelKarten[widget.kartennummer].bilder[0], width: 400, height: 400))
                                              ),
                                            ),
                                            Text("Neues Bild:"),
                                            FlatButton(onPressed: (){
                                              auswaehlenVorderseite(context);
                                            },child: Icon(Icons.add_a_photo, size: 60, color: Colors.white30)
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
                                            Text(widget.stapel.getThemengebietName(), style: MenuButtonTextStyle),
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
                                            },child: Icon(Icons.add_a_photo, size: 60, color: Colors.white30)
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

                          Row(
                            children: <Widget>[
                              Expanded(
                                child:
                                IconButton(
                                  icon: Icon(Icons.arrow_back_ios,color: Colors.white, size: 25),
                                  onPressed: (){
                                    if(-1 == widget.kartennummer-1)
                                      Navigator.pop(context, 'StapelAbschliessenDozent');
                                    else setState(() {
                                      widget.kartennummer  -- ;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.save,color: Colors.black,),
                                  iconSize: 60.0,
                                  tooltip: 'Stapel abschließen und hochladen',
                                  onPressed: (){
                                    LokaleDatenbankKarteiKarten.updateKk(widget.stapel.stapelKarten[widget.kartennummer]);
                                    Navigator.pop(context, 'StapelAbschliessenDozent');
                                  },
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios,color: Colors.white, size: 25),
                                  onPressed: (){
                                    if(widget.stapel.stapelKarten.length-1 == widget.kartennummer)
                                      Navigator.pop(context, 'StapelAbschliessenDozent');
                                    else setState(() {
                                      widget.kartennummer  ++ ;
                                    });

                                  },
                                )
                              )
                            ],
                          ),


                        ],
                      )
                  )
              );
            }
        );
      }).toList(),
      visibleCount: 3,
      stackFrom: StackFrom.Top,
      translationInterval: 6,
      scaleInterval: 0.03,
      onEnd: () => debugPrint("onEnd"),
      onSwipe: (int index, SwiperPosition position) => debugPrint("onSwipe $index $position"),
      onRewind: (int index, SwiperPosition position) => debugPrint("onRewind $index $position"),
    );

  }


}