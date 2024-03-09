
import 'package:htmely/functions.dart';
import 'package:htmely/mdType.dart';
import 'package:test/test.dart';

import 'testBase.dart';

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