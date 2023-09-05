import 'package:tp1/tools/FileReader.dart';
import 'package:tp1/tools/TextTools.dart';
import 'package:tp1/tp1/exo1.dart';
import 'package:test/test.dart';
import 'package:tp1/tp1/exo2.dart';
import 'package:tp1/tp1/exo3.dart';
import 'package:tp1/tp1/exo4.dart';
import 'package:tp1/tp1/exo5.dart';

main() {
  test("exo1", () {
    expect(() => exo1(), prints( "Hello, World!\n"));
  });

  test("exo2", () {
    expect(readFirstChar(FileReader("BellumCivile.txt")), "a");
    expect(readFirstChar(FileReader.fromString("Hello")), "H");
  });

  test("exo3", () {
    expect(countAl(FileReader("BellumCivile.txt")), 5);
    expect(countAl(FileReader.fromString("a la pause al bundy a une lampe et il est allité")), 2);
    expect(countAl(FileReader.fromString("il a la faim")), 0);
    expect(countAl(FileReader.fromString("")), 0);
    expect(countAl(FileReader.fromString("a")), 0);
  });

  test("exo4", () {
    expect(countWords(FileReader("BellumCivile.txt")), 342);
    expect(countWords(FileReader.fromString("un mot... mais: un autre mot, et encore;. un autre\nsur une nouvelle ligne.")), 14);
    expect(countWords(FileReader.fromString("One")), 1);
    expect(countWords(FileReader.fromString("One.")), 1);
    expect(countWords(FileReader.fromString("One. Two")), 2);
    expect(countWords(FileReader.fromString("a")), 1);
    expect(countWords(FileReader.fromString("")), 0);
    expect(countWords(FileReader.fromString(".")), 0);
    expect(countWords(FileReader.fromString("..")), 0);
  });

  test("exo5", ()
  {
    expect(read5Words(FileReader.fromString("One")), ["One"]);
    expect(read5Words(FileReader.fromString("One ")), ["One"]);
    expect(read5Words(FileReader.fromString("One. Two")), ["One", "Two"]);
    expect(read5Words(FileReader.fromString("One.\nTwo")), ["One", "Two"]);
    expect(read5Words(FileReader.fromString("One.\n Two")), ["One", "Two"]);
    expect(read5Words(FileReader.fromString("a")), ["a"]);
    expect(read5Words(FileReader.fromString(".")), []);
    expect(read5Words(FileReader.fromString("")), []);
    expect(read5Words(FileReader("BellumCivile.txt")), ["ad", "ea", "Caesar", "respondit", "nulli"]);
  });
}