import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MenuButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:pie_chart/pie_chart.dart';




class Quizende extends StatefulWidget {

  int anzahlKarten;

  Quizende({@required this.anzahlKarten});
  @override
  _Quizende createState() => _Quizende();
}

class _Quizende extends State<Quizende> {
  //Anzahl nur zum test
  int anzahl=10;
  int falsch=1;
  int richtig=3;

  double prozentAusrechnen(){
    double ausgabe=100.00*falsch;
    ausgabe=ausgabe/anzahl;
    return ausgabe;
  }


  Map<String, double> data = new Map();
  bool _loadChart = false;

  @override
  void initState() {
    data.addAll({
      'Richtig beantwortet': prozentAusrechnen()*1000,
      'Falsch beantwortet': 100000-prozentAusrechnen()*1000

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
        title: Text('Quizende!'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Number of Questions asked on StackOverflow',
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
