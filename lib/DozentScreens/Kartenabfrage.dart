import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';

class Kartenabfrage extends StatefulWidget {
  @override
  _KartenabfrageState createState() => _KartenabfrageState();
}

class _KartenabfrageState extends State<Kartenabfrage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                flex: 7,
                child: Card(
                  elevation: 0.0,
                  margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
                  color: Color(0xFF89B3FB),
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    onFlipDone: (status) {
                      print(status);
                    },
                    front: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Front', style: MenuButtonTextStyle),

                          Text('Click here to flip back',
                              style: MenuButtonTextStyle),
                        ],
                      ),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Back', style: MenuButtonTextStyle),
                          Text('Click here to flip front',
                              style: MenuButtonTextStyle),
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
                      //TODO Backend: Aktuelle Karte aus DB löschen
                      icon: Icon(Icons.cancel),
                      color: Colors.red,
                      iconSize: 60.0,
                      tooltip: 'Falsch',
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.check_circle),
                      color: Colors.green,
                      iconSize:60.0,
                      tooltip: 'Richtig',
                      onPressed: (){
                        Navigator.pop(context, 'StapelAbschliessenDozent');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
            ]),
      ),
    );
  }
}
