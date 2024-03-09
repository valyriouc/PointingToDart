import "fileReaderTests.dart";
import "toMarkdownNodeTests.dart";

void main() {
  final FileReaderTests readerTests = FileReaderTests();
  readerTests.run();

  final ToMarkdownNodeTests toMdTests = ToMarkdownNodeTests();
  toMdTests.run();
}