import 'dart:io';

class FileReader {

  late final Iterator<int> iterator;
  int last = -1;

  /*
    * Open a text file
    * filename : path of the file
    * Terminate the application on error
  */
  FileReader(String filename) {
      try {
        iterator = File(filename).readAsBytesSync().iterator;
        if (iterator.moveNext()) last = iterator.current;
      } on PathNotFoundException {
        throw 'Erreur lors de l\'ouverture du fichier "$filename"';
      }
  }

  FileReader.fromString(String content) {
    this.iterator = content.runes.iterator;
    if (iterator.moveNext()) last = iterator.current;
  }

  /*
    * Return the current character from the stream and read the next character
    * returns : the current character.
    * Terminate the application on error
  */
  String readNext() {
    if (last == -1) {
      throw "Lecture après la fin du fichier";
    }
    int current = last;
    if (iterator.moveNext()) {
      last = iterator.current;
    } else {
      last = -1;
    }
    return String.fromCharCode(current);
  }

  /*
    * Indicate if we reached the end od the stream
    * return true if all the characters have been read
  */
  bool isEndOfFile() {
    return last == -1;
  }

}