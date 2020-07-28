import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Stapel.dart';
import 'StapelAbschliessen.dart';


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
              Navigator.pushNamed(context, 'AlleStapelAnzeigen');
            },
          ),
          title: AutoSizeText(
            "Stapel Importieren",
            minFontSize: 6,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
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
                            child: Text('Hier kopierten Stapel einfügen'),
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
                        child: MenuButton(text: "Stapel Importieren", onPress: () async {
                              Stapel stapel = await Stapel.StapelfromList(stringParser(widget.eingabe));

                          Navigator.push(context,MaterialPageRoute(builder: (context)=>StapelAbschliessen(stapel: stapel)));
                        })
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  static List<String> stringParser(String s) {
    s = s.trimLeft().trimRight().substring(1, s.length - 1);
    List<String> l = s.split(',');
    print(s.toString());
    for (int i = 0; i < l.length; i++) {
      l[i] = l[i].trimLeft();
      //print(l[i]);
    }
    return l;
  }

}








