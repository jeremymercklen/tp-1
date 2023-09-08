import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:tp1/searchengine/Tree.dart';
import 'package:tp1/tools/TextTools.dart';

main() async {
  test("exo1", () {
    Tree? tree = null;
    tree = insertInTree(tree, "Posix", "");
    tree = insertInTree(tree, "BSD", "");
    tree = insertInTree(tree, "ANSI", "");
    tree = insertInTree(tree, "Win32", "");
    tree = insertInTree(tree, "OpenGL", "");
    tree = insertInTree(tree, "BSD", "test");
    tree = insertInTree(tree, "DirectDraw", "");
    tree = insertInTree(tree, "BSD", "");
    tree = insertInTree(tree, "SDL", "");

    var words = <String>[];
    walkTree(tree, (word) => words.add(word));
    expect(words.length, 7);
    expect(words.elementAt(0), "ANSI");
    expect(words.elementAt(1), "BSD");
    expect(words.elementAt(2), "DirectDraw");
    expect(words.elementAt(3), "OpenGL");
    expect(words.elementAt(4), "Posix");
    expect(words.elementAt(5), "SDL");
    expect(words.elementAt(6), "Win32");
  });

  test("exo2", () {
    Tree? tree = null;
    tree = insertInTree(tree, "Posix", "a");
    tree = insertInTree(tree, "Posix", "a");
    tree = insertInTree(tree, "Posix", "b");
    tree = insertInTree(tree, "Posix", "c");
    tree = insertInTree(tree, "Posix", "a");

    tree = insertInTree(tree, "BSD", "ab");
    tree = insertInTree(tree, "BSD", "b");
    tree = insertInTree(tree, "BSD", "c");
    tree = insertInTree(tree, "BSD", "a");
    tree = insertInTree(tree, "BSD", "a");
    tree = insertInTree(tree, "BSD", "a");
    tree = insertInTree(tree, "BSD", "c");
    tree = insertInTree(tree, "BSD", "c");
    tree = insertInTree(tree, "BSD", "b");

    tree = insertInTree(tree, "ANSI", "a");
    tree = insertInTree(tree, "ANSI", "c");
    tree = insertInTree(tree, "ANSI", "a");
    tree = insertInTree(tree, "ANSI", "a");
    tree = insertInTree(tree, "ANSI", "b");
    tree = insertInTree(tree, "ANSI", "a");
    tree = insertInTree(tree, "ANSI", "a");

    var mots = <String>[];
    walkTree(tree, (mot) => mots.add(mot));
    expect(mots.length, 3);
    expect(tree.resultatsRecherche.elementAt(0).count, 3);
    expect(tree.resultatsRecherche.elementAt(0).filename, "a");
    expect(tree.resultatsRecherche.elementAt(1).count, 1);
    expect(tree.resultatsRecherche.elementAt(1).filename, "b");
    expect(tree.resultatsRecherche.elementAt(2).count, 1);
    expect(tree.resultatsRecherche.elementAt(2).filename, "c");

    tree = tree.filGauche;
    expect(tree?.resultatsRecherche.elementAt(0).count, 1);
    expect(tree?.resultatsRecherche.elementAt(0).filename, "ab");
    expect(tree?.resultatsRecherche.elementAt(1).count, 2);
    expect(tree?.resultatsRecherche.elementAt(1).filename, "b");
    expect(tree?.resultatsRecherche.elementAt(2).count, 3);
    expect(tree?.resultatsRecherche.elementAt(2).filename, "c");
    expect(tree?.resultatsRecherche.elementAt(3).count, 3);
    expect(tree?.resultatsRecherche.elementAt(3).filename, "a");

    tree = tree?.filGauche;
    expect(tree?.resultatsRecherche.elementAt(0).count, 5);
    expect(tree?.resultatsRecherche.elementAt(0).filename, "a");
    expect(tree?.resultatsRecherche.elementAt(1).count, 1);
    expect(tree?.resultatsRecherche.elementAt(1).filename, "c");
    expect(tree?.resultatsRecherche.elementAt(2).count, 1);
    expect(tree?.resultatsRecherche.elementAt(2).filename, "b");
  });

  test("exo2", () async {
    Index index = Index();
    List<SearchResult> resultatsRecherche = [];
    await index.build("textes");
    resultatsRecherche = index.find('vente');
    expect(resultatsRecherche.elementAt(0).count, 4);
    expect(resultatsRecherche.elementAt(3).filename,
        "textes\\code_de_l_environnement\\R213-1.txt");
  });
}
