import '../tools/FileReader.dart';

countWords(FileReader fichier) {
  if (!fichier.isEndOfFile()) {
    int nbMots = 0;

    while (!fichier.isEndOfFile()) {
      int nbCaracteres = 0;
      String caractereActuel = fichier.readNext();

      while (caractereActuel != " " &&
          caractereActuel != "," &&
          caractereActuel != "." &&
          caractereActuel != ";" &&
          caractereActuel != ":" &&
          caractereActuel != "\n") {
        nbCaracteres++;
        if(!fichier.isEndOfFile())
          caractereActuel = fichier.readNext();
        else break;
      }
      if(nbCaracteres > 0)
        nbMots++;
    }
    return nbMots;
  } else
    return 0;
}

exo4(String nomFichier) {
  FileReader fichier = FileReader(nomFichier);
  print(countWords(fichier));
}