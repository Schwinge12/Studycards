import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'Dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/MainScreen/Karten/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelErstellen.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Stapel.dart';


class StapelImportieren extends StatefulWidget {

  final TextEditingController import= new TextEditingController();
  String eingabe="";

  @override
  _StapelImportieren createState() => _StapelImportieren();
}

class _StapelImportieren  extends State<StapelImportieren> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>StapelErstellen()));
            },
          ),
          title: AutoSizeText(
            "Stapel Importieren",
            minFontSize: 6,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: <Widget>[
            // action button
            /*IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 25),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenRueckseite(vorderSeite: this.widget,stapel: widget.stapel)));
              },

            ),*/
          ]

      ),


      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                child: Container(

                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('VORDERSEITE'),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            style: MenuButtonTextStyle,
                            controller: widget.import,
                            maxLines: 20,
                            onChanged: (String s){
                              widget.eingabe=s;
                            },
                          ),
                        )
                      ],
                    )

                ),
              ),

              SafeArea(
                child: Row(

                  children: <Widget>[

                    Expanded(
                        child: MenuButton(text: "Stapel Importieren", onPress: null)
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }


}








