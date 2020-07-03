import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:swipe_stack/swipe_stack.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';



class Kartenabfrage extends StatefulWidget {

  Stapel stapel;
  int kartennummer = 0;

  Kartenabfrage({@required this.stapel});

  @override
  _KartenanzeigeState createState() => _KartenanzeigeState();
}

class _KartenanzeigeState extends State<Kartenabfrage> {



  @override
  Widget build(BuildContext context) {
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
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(widget.stapel.getThemengebietName(), style: MenuButtonTextStyle),
                                            Text(widget.stapel.stapelKarten[widget.kartennummer].getVorderSeite(), style: MenuButtonTextStyle)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container( 
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                  color: Colors.white30,
                                                  child:
                                                  new Center(child: widget.stapel.stapelKarten[widget.kartennummer].bilder.length == 0
                                                      ? new Text("Kein Bild vorhanden.")
                                                      : new Image.file(widget.stapel.stapelKarten[widget.kartennummer].bilder[0], width: 400, height: 400))
                                              ),
                                            ),
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
                                          color: Colors.white30,
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(widget.stapel.getThemengebietName(), style: MenuButtonTextStyle),
                                            Text(widget.stapel.stapelKarten[widget.kartennummer].getRueckSeite(), style: MenuButtonTextStyle)
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                  color: Colors.white30,
                                                  child: new Center(child: widget.stapel.stapelKarten[widget.kartennummer].bilder.length < 2
                                                      ? new Text("Kein Bild vorhanden.")
                                                      : new Image.file(widget.stapel.stapelKarten[widget.kartennummer].bilder[0], width: 400, height: 400))
                                              ),
                                            ),
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
                                  //TODO Backend: Aktuelle Karte aus DB löschen
                                  //Spericherung.loeschen(Produkt zuLoeschendeKarte)
                                  icon: Icon(Icons.cancel,color: Colors.red,),
                                  iconSize: 60.0,
                                  tooltip: 'Karte falsch',
                                  onPressed: (){
                                    print(widget.stapel.stapelKarten.length.toString() + '- 1 :' + widget.kartennummer.toString());
                                    if(widget.stapel.stapelKarten.length -1 == widget.kartennummer)
                                    //todo Backend : logik fürs wiedererscheinen von karten
                                    Navigator.pop(context);
                                  else setState(() {
                                      widget.kartennummer  ++ ;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.check_circle,color: Colors.green,),
                                  iconSize: 60.0,
                                  tooltip: 'Stapel abschließen und hochladen',
                                  onPressed: (){
                                    print(widget.stapel.stapelKarten.length.toString() + '- 1 :' + widget.kartennummer.toString());
                                    if(widget.stapel.stapelKarten.length -1 == widget.kartennummer)
                                    Navigator.pop(context, 'StapelAbschliessenDozent');
                                    else setState(() {
                                    widget.kartennummer  ++ ;
                                    }
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  )
                  );
  }
}
