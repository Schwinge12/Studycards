import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/QuizNeu.dart';
import 'package:pie_chart/pie_chart.dart';

class Quizende extends StatefulWidget {

  QuizNeu quiz;
  int hilf;
  int richtigbeantwortet;
  int anzahlFragen;
  Quizende({@required this.quiz,this.hilf,this.richtigbeantwortet,this.anzahlFragen});
  @override
  _Quizende createState() => _Quizende();
}

class _Quizende extends State<Quizende> {





  Map<String, double> data = new Map();
  bool _loadChart = false;

  @override
  void initState() {
    int richig=widget.richtigbeantwortet;
    int anzahl=widget.anzahlFragen;
    double prozentAusrechnen(int anzahl, int falsch){
    double ausgabe=100.00*falsch;
    ausgabe=ausgabe/anzahl;
    return ausgabe;
  }
    int falsch= 0;
    int richtig= 0;// Überhaupt nötig ?

    data.addAll({
      'Richtig beantwortet': richtig.toDouble(),
      'Falsch beantwortet': falsch.toDouble()
    });
    super.initState();
  }
  List<Color> _colors = [
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Auswertung'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Auswertung der beantworteten Fragen',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
             Expanded(
               child: PieChart( 
                dataMap: data,
                colorList:
                _colors, // if not declared, random colors will be chosen
                animationDuration: Duration(milliseconds: 1500),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width /
                    0.8, //determines the size of the chart
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                showLegends: true,
                legendPosition:
                LegendPosition.right, //can be changed to top, left, bottom
                decimalPlaces: 1,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.blueGrey[900].withOpacity(0.9),
                ),
                chartType: ChartType.disc, //can be changed to ChartType.ring
            ),
             ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SafeArea(
                child: MenuButton(
                  text: 'Fertig',
                  onPress: (){
                    int anzahl= widget.quiz.richtigeFragenimQuizInsgesamt;
                    int falsch= widget.quiz.richtigeFragenimQuizInsgesamt-widget.quiz.richtigeFragenimQuizInsgesamt;
                    int richtig=widget.quiz.richtigeFragenimQuizInsgesamt;
                    print(richtig);
                    print(falsch);
                    print(anzahl);
                    Navigator.pushNamed(context, 'MenuPage');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
