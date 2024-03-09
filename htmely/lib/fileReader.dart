import "dart:io" as io;

class FileReader {
  
  String content;

  FileReader.fromMarkdown(String markdown) : 
    content = markdown;

  Iterable<String> lineIter() => content.split("\n");
  
  Iterable<T> convertToIter<T>(T Function(String) converter) sync* {
    for (final String line in lineIter()) {
      yield converter(line);
    }
  }

  static Future<FileReader> fromFile(String filepath) async {
    return await io.File(filepath).readAsString().then((String content) {
      return FileReader.fromMarkdown(content);
    });
  }
}
