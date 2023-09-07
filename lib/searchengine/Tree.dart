import 'package:quiver/strings.dart';
import 'package:tp1/tools/TextTools.dart';
import '../tools/FileReader.dart';

class Tree {
  String mot;
  Tree? filGauche;
  Tree? filDroit;
  List<SearchResult> resultatsRecherche;

  Tree(this.mot, this.filGauche, this.filDroit, this.resultatsRecherche);
}

Tree insertInTree(Tree? arbre, String mot, String nomFichier) {
  if (arbre == null)
    return new Tree(mot, null, null, [SearchResult(nomFichier, 1)]);

  if (mot == arbre.mot) {
    bool estDoublon = false;

    for (var indice in arbre.resultatsRecherche) {
      if (compareIgnoreCase(indice.filename, nomFichier) == 0) {
        estDoublon = true;
        indice.count++;
        break;
      }
    }

    if (!estDoublon) arbre.resultatsRecherche.add(SearchResult(nomFichier, 1));
    return arbre;
  }

  if (compareIgnoreCase(mot, arbre.mot) < 0)
    arbre.filGauche = insertInTree(arbre.filGauche, mot, nomFichier);
  else
    arbre.filDroit = insertInTree(arbre.filDroit, mot, nomFichier);
  return arbre;
}

walkTree(Tree? arbre, action) {
  if (arbre == null) return;
  walkTree(arbre.filGauche, action);
  action(arbre.mot);
  walkTree(arbre.filDroit, action);
}

findInTree(Tree? arbre, String mot, List<SearchResult> resultatsRecherche) {
  if (arbre == null) return;
  if (arbre.mot == mot) {
    arbre.resultatsRecherche = resultatsRecherche;
    return;
  }
  findInTree(arbre.filGauche, mot, resultatsRecherche);
  findInTree(arbre.filDroit, mot, resultatsRecherche);
}
