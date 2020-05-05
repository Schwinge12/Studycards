import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:swipe_stack/swipe_stack.dart';



class Kartenabfrage extends StatefulWidget {
  @override
  _KartenanzeigeState createState() => _KartenanzeigeState();
}

class _KartenanzeigeState extends State<Kartenabfrage> {




  @override
  Widget build(BuildContext context) {
    return SwipeStack(

      //children sind anzahl der Elemente die Abgefragt werden
      children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12].map((int index) {
        return SwiperItem(
            builder: (SwiperPosition position, double progress) {
              return Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[

                          //TODO Backend: Karteninhalte einfügen


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
                                front: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Front', style: MenuButtonTextStyle),
                                      Text('Click here to flip back', style: MenuButtonTextStyle)
                                    ],
                                  ),
                                ),
                                back: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Back', style: MenuButtonTextStyle),
                                      Text('Click here to flip front',style: MenuButtonTextStyle),
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
                                  //TODO Backend: Karte nochmal abfragen
                                  icon: Icon(Icons.cancel,color: Colors.red,),
                                  iconSize: 60.0,
                                  tooltip: 'falsch',
                                  onPressed: (){

                                  },

                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.check_circle,color: Colors.green,),
                                  iconSize: 60.0,
                                  tooltip: 'Richtig',
                                  onPressed: (){
                                //TODO Backend: Karte als richtig abspeichern
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
