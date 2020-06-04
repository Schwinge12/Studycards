import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ErfolgsAnzeige extends StatefulWidget{

  @override
  _ErfolgsAnzeigeState createState()=>_ErfolgsAnzeigeState();

}

class _ErfolgsAnzeigeState extends State<ErfolgsAnzeige> {

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 100,
              ranges: <GaugeRange>[

                GaugeRange(startValue: 0, endValue: 50, color:Colors.red),
                GaugeRange(startValue: 50,endValue: 90,color: Colors.orange),
                GaugeRange(startValue: 90,endValue: 100,color: Colors.green)],
              pointers: <GaugePointer>[
                NeedlePointer(value: 90,needleColor: Colors.black)],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(widget: Container(child:
                //TODO Backend: variable erstellen um den lernfortschritt für den jeweiligen Stapel erfassen zu können
                Text('90.0',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black))),
                    angle: 90, positionFactor: 0.5
                )]
          )]
    );
  }
}


