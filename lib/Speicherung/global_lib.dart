library global_lib;

class GlobalLib implements Function {

  //________________________________GolbalVariables_____________________________
  static var idCounter = 0;

  //____________________________________OnCall__________________________________

int call() {
  idCounter ++;
  return idCounter;
}
}
