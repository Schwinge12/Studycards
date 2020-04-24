import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

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
                        color: Color(0xFF89B3FB),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Front', style: Theme.of(context).textTheme.headline),
                          Text('Click here to flip back',
                              style: Theme.of(context).textTheme.body1),
                        ],
                      ),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF89B3FB),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Back', style: Theme.of(context).textTheme.headline),
                          Text('Click here to flip front',
                              style: Theme.of(context).textTheme.body1),
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
                    child: FloatingActionButton(
                      onPressed: (){

                      },
                      backgroundColor: Color(0xFF89B3FB),
                      child: Icon(Icons.add),
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
