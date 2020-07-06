import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankKarteikarten.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankStapel.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Stapel.dart';



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
              return Scaffold(
                appBar: AppBar(
                  title: Center(
                    child: AutoSizeText(
                      widget.stapel.getStudienfachName(),
                      textAlign: TextAlign.center,
                      minFontSize: 6,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                ),
                ),
                ),
                body: SafeArea(
                  child: Material(
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
                                front: SafeArea(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              AutoSizeText(widget.stapel.getThemengebietName()+'\n'+'\n'+widget.stapel.stapelKarten[widget.kartennummer].getVorderSeite(),
                                                textAlign: TextAlign.center,
                                                style: KleinereAnzeigeTextStyle,
                                                minFontSize: 6,
                                                maxLines: 6,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                    color: Colors.white,
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
                                ),
                                back: SafeArea(
                                  child: Column(
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
                                              AutoSizeText(widget.stapel.getThemengebietName()+'\n'+'\n'+widget.stapel.stapelKarten[widget.kartennummer].getRueckSeite(),
                                                textAlign: TextAlign.center,
                                                style: KleinereAnzeigeTextStyle,
                                                minFontSize: 6,
                                                maxLines: 6,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child:
                                IconButton(
                                  //Spericherung.loeschen(Produkt zuLoeschendeKarte)
                                  icon: Icon(Icons.cancel,color: Colors.red,),
                                  iconSize: 60.0,
                                  tooltip: 'Karte falsch',
                                  onPressed: (){
                                    print(widget.stapel.stapelKarten.length.toString() + '- 1 :' + widget.kartennummer.toString());
                                    widget.stapel.stapelKarten[widget.kartennummer].answeredTrue = false;
                                    if(widget.stapel.stapelKarten.length -1 == widget.kartennummer) {
                                      LokaleDatenbankStapel
                                          .alleKarteikartenUpdaten(
                                          widget.stapel);
                                      Navigator.pop(context);
                                    }
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
                                    widget.stapel.stapelKarten[widget.kartennummer].answeredTrue = true;
                                    if(widget.stapel.stapelKarten.length -1 == widget.kartennummer) {
                                      LokaleDatenbankStapel
                                          .alleKarteikartenUpdaten(widget.stapel);
                                      Navigator.pop(
                                          context, 'StapelAbschliessenDozent');
                                    }
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
                  ),
                ),
              );
  }
}
