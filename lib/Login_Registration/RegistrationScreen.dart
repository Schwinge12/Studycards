import 'package:flutter/material.dart';
import 'package:karteikartenapp/Speicherung/Student.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var _userdata = new Userdata();
  final _auth = FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _email;
  String _passwort1;
  String _passwort2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Zurück zum Login")),
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
                  _passwort1 = value;
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
              TextFormField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _passwort2 = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white30,
                  hintText: 'Passwort wiederholen',
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
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_passwort1 != _passwort2) {
                        showDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                                  title: Text('Falsche Eingabe!'),
                                  content:
                                      Text('Passwörter müssen identisch sein'),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                            barrierDismissible: false);
                      } else {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: _email, password: _passwort1);

                        //await newUser.user.sendEmailVerification();

                        if (newUser != null) {
                          await newUser.user.sendEmailVerification();

                          //Navigator.pushNamed(context, 'LoginScreen');
                        }
                      }

                      _userdata.einfuegen(new Student()
                          .mitEmail(_email)
                          .mitPasswort(_passwort1));
                      //Erstellt neues Konto - Konstruktor entscheidet über art new Dozent() / new Tutor

                      //Todo Frontend - angabe als student/Dozent/Tutor -> weiterleitung auf login/menu
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Registrieren',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
