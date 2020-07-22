

import 'dart:io';


import 'Userdata.dart';

class FileManager {
//____________________________________Variables_______________________________
  static Userdata _userdata = new Userdata();

//____________________________________Methods_________________________________

  // Karteikarte/bildID (aufgrund mehrerer bilder)
  static Future<File> getFile(String themengebiet, int kartenID ,int fileID) async {
    try {
      return File(await getPath(themengebiet, kartenID, fileID));
    }
    catch(e){
      print(e);
      return null;
    }
  }
  static Future<String> getPath(String themengebiet,int kartenID, int fileID) async {
      final path = await _userdata.datenspeicherort;
      final username =  _userdata.getKonto().getUsername();
      final dir = '$path/$username/$themengebiet/$kartenID';
      if (! await Directory(dir).exists()) {
        await new Directory(dir).create(recursive: true).then((Directory directory){
          print(directory.path + ' created');
        });

      }
      if (fileID != null)
        return(('$dir/$fileID'));
      return (dir);
  }
  static void writeFile(String id, int kartenID, File fileToWrite, int fileID) async {
    if (fileToWrite != null)
    fileToWrite.copy(await getPath(id, kartenID, fileID)) ;
    print(await getPath(id, kartenID, fileID) + ' created : File');
  }

}
