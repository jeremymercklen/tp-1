import 'package:tp1/tools/TextFileTools.dart';

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
        caractereActuel != "\n" &&
        caractereActuel != "\r" &&
        caractereActuel != "(" &&
        caractereActuel != ")") {
      if (!fichier.isEndOfFile()) {
        if (mot != null)
          mot += caractereActuel;
        else
          mot = caractereActuel;
        caractereActuel = fichier.readNext();
      } else {
        if (mot != null)
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

countWord(FileReader fichier, String motCherche) {
  String? mot = "";
  int nbOccurence = 0;

  while (mot != null) {
    mot = readWord(fichier);
    if (mot == motCherche) nbOccurence++;
  }

  return nbOccurence;
}

class SearchResult {
  String filename;
  int count;

  SearchResult(this.filename, this.count);

  @override
  String toString() {
    return "($count) $filename";
  }

  @override
  bool operator ==(Object other) {
    return (this.filename == filename) && (this.count == count);
  }
}

Future<List<SearchResult>> search(
    String nomRepertoire, String motCherche) async {
  List<SearchResult> listeResultatRecherche = [];
  await walkDirectory(nomRepertoire, (path) {
    int nbOccurence = countWord(FileReader(path), motCherche);
    if (nbOccurence > 0) {
      listeResultatRecherche.add(SearchResult(path, nbOccurence));
    }
  });
  listeResultatRecherche.sort((a, b) => b.count.compareTo(a.count));
  return listeResultatRecherche;
}
