import 'dart:io';

walkDirectory(String nomRepertoire, void action(String path)) async {
  var cheminRepertoire = await Directory(nomRepertoire)
      .list(recursive: true)
      .where((event) => event.statSync().type == FileSystemEntityType.file)
      .map((event) => event.path)
      .forEach((path) {
    action(path);
  });
}
