import '../tools/FileReader.dart';

countAl(FileReader fichier) {
  int nbAl = 0;
  String? caractereActuel;
  String? caracterePrecedent;

  while(!fichier.isEndOfFile()) {
    caracterePrecedent = caractereActuel;
    caractereActuel = fichier.readNext();

    if((caracterePrecedent == "a") && (caractereActuel == "l"))
      nbAl++;
  }

  return nbAl;
}

exo3(String nomFichier) {
  FileReader fichier = FileReader(nomFichier);
  print(countAl(fichier));
}