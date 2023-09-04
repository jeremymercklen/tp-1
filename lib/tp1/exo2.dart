import 'package:tp1/tools/FileReader.dart';

readFirstChar(FileReader fichier) {
  return fichier.readNext();
}

exo2(String nomFichier) {
  FileReader fichier = FileReader(nomFichier);
  readFirstChar(fichier);
}