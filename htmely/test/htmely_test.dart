import "package:htmely/fileReader.dart";
import "package:htmely/mdType.dart";
import "package:test/test.dart";
import 'package:htmely/functions.dart';
import "dart:io" as io;

abstract class TestBase {
  void run();
}

class FileReaderTests extends TestBase {
  @override
  void run() {
    group('MarkdownReader', () {
    test('lineIter should split content into lines', () {
      final markdown = 'Line 1\nLine 2\nLine 3';
      final reader = FileReader.fromMarkdown(markdown);

      final lines = reader
        .lineIter()
        .toList();

      expect(lines, ['Line 1', 'Line 2', 'Line 3']);
    });

    test('convertToIter should apply converter to each line', () {
      final markdown = '1\n2\n3';
      final reader = FileReader.fromMarkdown(markdown);

      final numbers = reader.convertToIter<int>((line) => int.parse(line)).toList();

      expect(numbers, [1, 2, 3]);
    });

    test('fromFile should read content from a file', () async {
      final tempFile = await io.File('temp_test_file.txt').writeAsString('Hello\nWorld');
      final reader = await FileReader.fromFile(tempFile.path);

      final lines = reader.lineIter().toList();

      expect(lines, ['Hello', 'World']);

      // Clean up the temporary file
      await tempFile.delete();
    });
  });
  }
}

class ToMarkdownNodeTests extends TestBase {
  @override 
  void run() {
    group('toMarkdownNode', () {
    test('should return H1 node for "# Heading 1"', () {
      final result = toMarkdownNode("# Heading 1");
      expect(result.mdType, MdType.H1);
      expect(result.content, "Heading 1");
    });

    test('should return H2 node for "## Heading 2"', () {
      final result = toMarkdownNode("## Heading 2");
      expect(result.mdType, MdType.H2);
      expect(result.content, "Heading 2");
    });

    test('should return H3 node for "### Heading 3"', () {
      final result = toMarkdownNode("### Heading 3");
      expect(result.mdType, MdType.H3);
      expect(result.content, "Heading 3");
    });

    test('should return ULI node for "* List item"', () {
      final result = toMarkdownNode("* List item");
      expect(result.mdType, MdType.ULI);
      expect(result.content, "List item");
    });

    test('should return ULI node for "- Another list item"', () {
      final result = toMarkdownNode("- Another list item");
      expect(result.mdType, MdType.ULI);
      expect(result.content, "Another list item");
    });

    test('should return OLI node for "1. Ordered item"', () {
      final result = toMarkdownNode("1. Ordered item");
      expect(result.mdType, MdType.OLI);
      expect(result.content, "Ordered item");
    });

    test('should return P node for "This is a paragraph."', () {
      final result = toMarkdownNode("This is a paragraph.");
      expect(result.mdType, MdType.P);
      expect(result.content, "This is a paragraph.");
    });
  });
  }
}

void main() {
  final FileReaderTests readerTests = FileReaderTests();
  readerTests.run();

  final ToMarkdownNodeTests toMdTests = ToMarkdownNodeTests();
  toMdTests.run();
}