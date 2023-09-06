import '../tools/TextFileTools.dart';

exo6(String nomRepertoire) async {
  print("debut exo6");
  int nbFichier = 0;
  await walkDirectory(nomRepertoire, (path) {
    nbFichier++;
    //print(path);
  });
  print(nbFichier);
}