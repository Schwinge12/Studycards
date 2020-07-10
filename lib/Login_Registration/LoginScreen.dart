import 'package:flutter/material.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankKonto.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Konten/Student.dart';
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

  _LoginScreenState(){loginfromDB();}

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
                  onChanged: (value){
                    _email=value.trim();
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
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    _passwort=value;
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

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: MaterialButton(
                      onPressed: () async {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: _email, password: _passwort);
                        if (user != null) {
                          _userdata.einfuegen(new Student().mitUsername(_email));
                          LokaleDatenbankKonto.insertKonto(new Student().mitUsername(_email).mitPasswort(_passwort));
                          Navigator.pushNamed(context, 'MenuPage');
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

  Future<void> loginfromDB() async {
    try{
      Student s = await LokaleDatenbankKonto.getKonto();
      final user = await _auth.signInWithEmailAndPassword(
          email: s.getUsername(), password: s.getPassword());
      if (user != null){
        _userdata.einfuegen(new Student().mitUsername(s.getUsername()));
        Navigator.pushNamed(context, 'MenuPage');
      }
    }
    catch(e){
      print(e);
    }

  }
}
