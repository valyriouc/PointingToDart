import 'dart:io';

import 'package:htmely/fileHandle.dart';
import 'package:htmely/functions.dart' as func;
import 'package:htmely/htmlConverter.dart';
import 'package:htmely/markdownNode.dart';

mixin EmptyMixin on Map<String, String> {
  static Map<String, String> empty () => {};
}

typedef CliArgs = Map<String, String>;

CliArgs parseArgs(List<String> args) {
  if (args.length != 1) {
    throw "Expected a base path";
  }
  return CliArgs.from({"basepath": args[0]});
}

Future<void> main(List<String> arguments) async {
  final Map<String, String> args = parseArgs(arguments);

  final String basepath = args["basepath"] ?? "null";
  for (final FileSystemEntity mdFile in Directory(basepath).listSync(recursive: true).where((file) => file.path.endsWith(".md"))) {
    final FileHandle reader = await FileHandle.fromFile(mdFile.path);
    Iterable<MarkdownNode> nodes = reader.convertToIter<MarkdownNode>((line) => func.toMarkdownNode(line));
    String html = HtmlConverter(nodes).convert();
    var htmlFile = await mdFile.rename(mdFile.path.replaceFirst(".md", ".html"));
    FileWriter.toFile(htmlFile.path, html);
  }
}
