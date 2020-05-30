import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

const MenuButtonTextStyle= TextStyle(
  color: Colors.black,
  fontSize: 30.0,
  //fontWeight: FontWeight.w800,
//  fontFamily: 'Baloobhai2-ExtraBold.ttf',
  fontFamily: 'Pacifico-Regular',
);


const WeisserTextStyle=TextStyle(
color: Colors.white,
fontFamily: 'Pacifico-Regular',
fontSize: 20.0
);

const CardTextStyle=TextStyle(
    color: Colors.black,
    fontFamily: 'Pacifico-Regular',
    fontSize: 20.0
);

class ProzentWidget extends StatefulWidget{

  @override
  _ProzentWidget createState()=>_ProzentWidget();

}


class _ProzentWidget extends State<ProzentWidget> {


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


