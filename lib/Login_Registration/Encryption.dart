import 'package:encrypt/encrypt.dart';

class Encryption{
  static final _key = Key.fromUtf8('9123v8znlkavdwj8hrv213rhnv1vr01r');
  static final _iv = IV.fromLength(16);

  static final _encrypter = Encrypter(AES(_key));


  static Encrypted encrypt(String psw){ return _encrypter.encrypt(psw, iv: _iv);}
  static String decrypt(Encrypted crypt){ return _encrypter.decrypt(crypt, iv: _iv);}


}