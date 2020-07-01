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
    return SwipeStack(
      children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,].map((int index) {
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
                                            Text(widget.stapel.getStudienfachName(), style: MenuButtonTextStyle),
                                            Text(widget.stapel.stapelKarten[widget.kartennummer].vorderSeite, style: MenuButtonTextStyle)
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

                                            Text('Hier Bild Anzeigen', style: MenuButtonTextStyle)
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
                                            Text('Front', style: MenuButtonTextStyle),
                                            Text(widget.stapel.stapelKarten[widget.kartennummer].rueckSeite, style: MenuButtonTextStyle)
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

                                            Text('Hier Bild Anzeigen', style: MenuButtonTextStyle)
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
                                    });
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
