import 'package:flutter/material.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  var _userdata = new Userdata();
  String _email;
  String _passwort;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      height: 200.0,
                      child: Image.asset('images/LogoOhneKreis.PNG'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
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
                    hintText: 'Email',
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
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    _passwort = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white30,
                    hintText: 'Passwort',
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
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: MaterialButton(
                      onPressed: () async {
                        final user = await _auth.signInWithEmailAndPassword(email: _email, password: _passwort);
                        if (user != null) {
                        Navigator.pushNamed(context, 'MenuPage');
                        }
                        // anmeldung über email nach registrierung mit Email

                        //Bis Datenbankverbindung steht passswort nutzen um zwischen dozent oder student zu unterscheiden
                        if (_passwort == 'dozent') {
                          Navigator.pushNamed(context, 'MenuPage');
                        }

                        if (_passwort == 'student') {
                          Navigator.pushNamed(context, 'MenuPageStudent');
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Anmelden',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: MaterialButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, 'PasswortVergessenScreen');
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Passwort vergessen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: MaterialButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, 'RegistrationScreen');
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Registrierung',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
