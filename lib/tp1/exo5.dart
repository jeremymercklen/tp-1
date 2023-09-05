import '../tools/FileReader.dart';
import '../tools/TextTools.dart';

read5Words(FileReader fichier) {
  List<String> mots = [];
  for(int i = 0; i < 5; i++ ) {
    String? mot = readWord(fichier);
    if(mot == null)
      break;
    else
      mots.add(mot);
  }
  return mots;
}