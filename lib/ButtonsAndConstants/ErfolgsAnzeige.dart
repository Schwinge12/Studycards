import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ErfolgsAnzeige extends StatefulWidget{
  double trueFalseRatio = 0;
  @override
  _ErfolgsAnzeigeState createState()=>_ErfolgsAnzeigeState();
  ErfolgsAnzeige withTrueFalseRatio(var ratio){
    this.trueFalseRatio = ratio;
    //print(ratio);
    return this;
  }

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
                NeedlePointer(value: widget.trueFalseRatio ,needleColor: Colors.black)],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(widget: Container(child:
                Text(widget.trueFalseRatio.round().toString() + ' %',style: KleinereAnzeigeTextStyle)),
                    angle:  90 , positionFactor: 0.8
                )]
          )]
    );
  }

}


