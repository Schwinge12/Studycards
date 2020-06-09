import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:swipe_stack/swipe_stack.dart';
import 'package:karteikartenapp/Speicherung/Karteikarte.dart';



class Quiz extends StatefulWidget {

  @override
  _KartenanzeigeState createState() => _KartenanzeigeState();
}

class _KartenanzeigeState extends State<Quiz> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Frage',style: WeisserTextStyle,)),
      ),


    );

  }


}
