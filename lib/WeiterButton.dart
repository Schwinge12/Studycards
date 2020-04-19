import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

//https://pub.dev/packages/clippy_flutter#-readme-tab-   Import Link für Button-Formen
import 'package:clippy_flutter/clippy_flutter.dart';

class WeiterButton extends StatelessWidget {

  WeiterButton({this.onTap});

  Function onTap;

  @override
  Widget build(BuildContext context) {

    return Arrow(
      triangleHeight: 30.0,
      rectangleClipHeight: 10.0,
      edge: Edge.RIGHT,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.blueAccent[200],
          width: 100.0,
          height: 70.0,
          child: Center(
            child: Text(
              'WEITER  ',
              style: WeisserTextStyle,
            ),
          ),
        ),
      ),
    );
  }

}