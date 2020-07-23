import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/ErfolgsAnzeige.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/ButtonsAndConstants/FlexButton.dart';
import 'package:karteikartenapp/MainScreen/Stapel/AlleStapelAnzeigen.dart';
import 'package:karteikartenapp/MainScreen/Karten/Kartenabfrage.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelUeberarbeiten.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Stapel.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankStapel.dart';
import 'package:share/share.dart';
import 'package:share_extend/share_extend.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankKarteikarten.dart';

class StapelStatus extends StatefulWidget{

  Stapel stapel;
  AlleStapel alleStapel;

  StapelStatus({@required this.stapel});


  @override
  StapelStatusState createState()=>StapelStatusState();
}

class StapelStatusState extends State<StapelStatus>{
  final dbHelfer = LokaleDatenbankStapel.instance;

  StapelStatusState();
String ueberschrift="Viel Spaß damit";
  Userdata userdata = new Userdata();


  @override
  Widget build(BuildContext context) {
    // LokaleDatenbankStapel.ausgeben(widget.stapel.getThemengebietName());
    return Scaffold(
        appBar: AppBar(
          title:Center(
            child: AutoSizeText(
              widget.stapel.getStudienfachName(),
              textAlign: TextAlign.center,
              minFontSize: 6,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.pushNamed(context,'AlleStapelAnzeigen');
            },
          ),

          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 35),
              onPressed: ()async{
                showDialog(
                    context: context,
                    builder: (_) =>
                        CupertinoAlertDialog(
                          content:
                          Text(
                              'Soll der aktuelle Stapel wirklich gelöscht werden?'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('Stapel löschen'),
                              onPressed: () async {
                                await _loeschen();
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>AlleStapel()));
                              },
                            ),
                          ],
                        ),
                    barrierDismissible: true);
              },
            ),
            IconButton(
              icon: Icon(Icons.share,color: Colors.white, size: 35),
              onPressed:() {
                final RenderBox box = context.findRenderObject();
               // for (int i=1; i<widget.stapel.stapelKarten.length; i++)

                List<List<String>> stapelliste = new List<List<String>>();
                for(int i=0; i<widget.stapel.stapelKarten.length; i++){
                  List<String> kkListe = new List<String>();
                  kkListe = LokaleDatenbankKarteiKarten.kkToStringList(widget.stapel.stapelKarten[i]);
                  stapelliste.add(kkListe);
                  ShareExtend.shareMultiple(kkListe, "Servus");
                }

                //ShareExtend.shareMultiple();

                //Share.share(

                   // widget.stapel.getStudiengang(),
                  //  subject: widget.stapel.getThemengebietName(),
                   // sharePositionOrigin:
                    //box.localToGlobal(Offset.zero) &
                   // box.size);

                //for(int i =0; i<widget.stapel.stapelKarten.length;i++)
                //{
                  //widget.stapel.stapelKarten[i].getVorderSeite();
                 // widget.stapel.stapelKarten[i].getRueckSeite();
                 // for(int j =0; j<widget.stapel.stapelKarten[i].bilder.length;j++)
                  //{
                  //  widget.stapel.stapelKarten[i].bilder[j];
                 // }
                //}
                }
            ),
          ]
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                10.0, // horizontal, move right 10
                10.0, // vertical, move down 10
              ),
            )
          ],
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[

            Expanded(
              child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText('Anzahl der Karten: '+widget.stapel.stapelKarten.length.toString(),
                  style: MenuButtonTextStyle,
                  minFontSize: 20,
                ),
                ),
              ),
              ),
            Expanded(
              child: Center(child:
              AutoSizeText('Aktueller Lernfortschritt:',
                style: MenuButtonTextStyle,
                minFontSize: 20,
              ),
              ),
            ),
            Expanded(
              flex: 7,
              child: ErfolgsAnzeige(
              ).withTrueFalseRatio((widget.stapel.getantworten())/(widget.stapel.stapelKarten.length) * 100)
            ),
            Expanded(
              flex: 2,
              child: FlexButton(
                color: Colors.green,
                style: WeisserTextStyle,
                text: 'Jetzt Lernen',
                onPress: (){
                  if(widget.stapel.stapelKarten.length > 0)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Kartenabfrage(stapel: widget.stapel)));
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: FlexButton(
                color: Colors.blue,
                style: WeisserTextStyle,
                text: 'Bearbeiten',
                onPress: (){
                  if(widget.stapel.stapelKarten.length > 0)
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>StapelUeberarbeiten(stapel: widget.stapel)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _loeschen() async{

    print(widget.stapel.getID());
    await LokaleDatenbankStapel.stapelLoeschen(widget.stapel);
    await userdata.loeschen(widget.stapel);
  }
}