import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';




class Quiz extends StatefulWidget {

  int anzahlKarten;

  Quiz({@required this.anzahlKarten});
  @override
  _Quiz createState() => _Quiz();
}

class _Quiz extends State<Quiz> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz',style: WeisserTextStyle,)),
          actions: <Widget>[
            // action button
            IconButton(
                icon: Icon(Icons.home,color: Colors.white, size: 35),
                onPressed:() {
                  Navigator.pushNamed(context, 'MenuPage');
                }
            ),
          ]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(

                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10.0, // has the effect of softening the shadow
                        spreadRadius: 5.0, // has the effect of extending the shadow
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  height: 350,
                  width: 200,
                  child: Center(
                    child: Text(
                      'Welches ist das Land mit den meisten Einwohnern?',style: MenuButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: FlatButton(
              child: Container(
                height: 50,
                width:500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white30,
                ),
                child: Center(
                  child: Text(
                    'Deutschland'
                  ),
                ),

                
              ),
              onPressed: (){

              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Container(
                height: 50,
                width:500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white30,
                ),
                child: Center(
                  child: Text(
                      'Frankreich'
                  ),
                ),


              ),
              onPressed: (){

              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Container(
                height: 50,
                width:500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white30,
                ),
                child: Center(
                  child: Text(
                      'China'
                  ),
                ),


              ),
              onPressed: (){

              },
            ),
          ),
          Expanded(
            child: SafeArea(
              child: FlatButton(
                child: Container(
                  height: 50,
                  width:500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white30,
                  ),
                  child: Center(
                    child: Text(
                        'Brasilien'
                    ),
                  ),


                ),
                onPressed: (){
                  //Nur zum Testen(Quizende)
                  Navigator.pushNamed(context, 'Quizende');
                },
              ),
            ),
          ),
          




        ],
      ),



    );

  }


}
