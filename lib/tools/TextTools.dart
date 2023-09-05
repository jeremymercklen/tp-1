import 'FileReader.dart';

String? readWord(FileReader fichier) {
    String? mot;

    while (!fichier.isEndOfFile()) {
      String caractereActuel = fichier.readNext();

      while (caractereActuel != " " &&
          caractereActuel != "," &&
          caractereActuel != "." &&
          caractereActuel != ";" &&
          caractereActuel != ":" &&
          caractereActuel != "\n") {

        if(!fichier.isEndOfFile()) {
          if(mot != null)
            mot += caractereActuel;
          else
            mot = caractereActuel;
          caractereActuel = fichier.readNext();
        }
        else {
          if(mot != null)
            mot += caractereActuel;
          else
            mot = caractereActuel;
          break;
        }
      }
      if (mot != null) {
        return mot;
      } else {
        return readWord(fichier);
      }
    }
    return mot;
}