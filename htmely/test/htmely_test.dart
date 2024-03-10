
import "fileReaderTests.dart";
import "htmlConverterTests.dart";
import "htmlTagTests.dart";
import "toMarkdownNodeTests.dart";

void main() {
  final FileHandleTests readerTests = FileHandleTests();
  readerTests.run();

  final ToMarkdownNodeTests toMdTests = ToMarkdownNodeTests();
  toMdTests.run();

  final HtmlTagTests htmlTagTests = HtmlTagTests(); 
  htmlTagTests.run();

  final HtmlConverterTests converterTests = new HtmlConverterTests();
  converterTests.run();
}