import 'package:tp1/searchengine/Tree.dart';
import '../tools/FileReader.dart';
import 'package:tp1/tools/TextTools.dart';

exo2(String nomFichier) {
  String? mot = readWord(FileReader(nomFichier));
  Tree? arbre;

  if (mot != null) insertInTree(arbre, mot, nomFichier);
}
