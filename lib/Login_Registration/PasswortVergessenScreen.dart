import 'package:flutter/material.dart';

class PasswortVergessenScreen extends StatefulWidget {
  @override
  _PasswortVergessenScreenState createState() =>
      _PasswortVergessenScreenState();
}

class _PasswortVergessenScreenState extends State<PasswortVergessenScreen> {
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: SafeArea(
                  child: Container(
                    height: 180.0,
                    child: Image.asset('images/LogoOhneKreis.PNG'),
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _email = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white30,
                  hintText: 'E-Mail',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF58A4B0), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF58A4B0), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    //Todo Frontend: Absenden-Button und noch fehlende Funktion (loginScreen onPressed auf PasswortVergessenScreen)
  }
}
