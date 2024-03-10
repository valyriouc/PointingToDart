import "dart:io" as io;

class FileHandle {
  
  String content;

  FileHandle.fromMarkdown(String markdown) : 
    content = markdown;

  Iterable<String> lineIter() => content.split("\n");
  
  Iterable<T> convertToIter<T>(T Function(String) converter) sync* {
    for (final String line in lineIter()) {
      yield converter(line);
    }
  }

  static Future<FileHandle> fromFile(String filepath) async {
    return await io.File(filepath).readAsString().then((String content) {
      return FileHandle.fromMarkdown(content);
    });
  }
}

class FileWriter {
  static Future<void> toFile(String filepath, String content) async {
    await io.File(filepath).writeAsString(content);
  }
} 