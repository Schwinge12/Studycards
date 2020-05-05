import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';

class StapelUeberarbeiten extends StatefulWidget {
  @override
  _StapelUeberarbeitenState createState() => _StapelUeberarbeitenState();
}

class _StapelUeberarbeitenState extends State<StapelUeberarbeiten> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                child: Card(
                  elevation: 0.0,
                  margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),

                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    speed: 500,
                    onFlipDone: (status) {

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
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child:
                      IconButton(
                        //TODO Backend: Aktuelle Karte aus DB löschen
                        icon: Icon(Icons.delete,color: Colors.red),
                        iconSize: 45.0,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.check_circle,color: Colors.green,),
                        iconSize: 45.0,
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
