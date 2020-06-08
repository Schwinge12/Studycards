library global_lib;

class GlobalLib implements Function {

  //________________________________GolbalVariables_____________________________
  static var idCounter = 0;


  //_________________________________Singelton__________________________________
  static final GlobalLib _gl = GlobalLib._internal();
  factory GlobalLib() {
    return _gl;
  }
  GlobalLib._internal();
  //____________________________________OnCall__________________________________

int call() {
  idCounter ++;
  return idCounter;
}
}
