

import 'dart:io';


import 'Userdata.dart';

class FileManager {
//____________________________________Variables_______________________________
  static Userdata _userdata = new Userdata();

//____________________________________Methods_________________________________

  // Karteikarte/bildID (aufgrund mehrerer bilder)
  static Future<File> getFile(int id, int fileID) async {
    try {
      return File(await getPath(id, fileID));
    }
    catch(e){
      print(e);
      return null;
    }
  }
  static Future<String> getPath(int id, int fileID) async {
      final path = await _userdata.datenspeicherort;
      final username =  _userdata.getKonto().getUsername();
      final dir = '$path/$username/$id';
      if (! await Directory(dir).exists()) {
        new Directory(dir);
        print('$dir created');
      }
      if (fileID != null)
        return(('$dir/$fileID'));
      return (dir);
  }
  static void writeFile(int id, File fileToWrite, int fileID) async {
    fileToWrite.copy(await getPath(id, fileID)) ;
  }

}
/*BSP Methode für Karteikarte (ID=12)
new Karteikarte()
  .mitFile(FileManager.getFile(ID, kkBilderIndex) )
  .mitFile(FileManager.getFile(12, 0) ) -> erstes Bild
  .mitFile(FileManager.getFile(12, 1) ) -> 2tes Bild etc...
 */