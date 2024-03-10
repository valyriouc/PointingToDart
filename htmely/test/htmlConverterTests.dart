import 'dart:js_util';

import 'package:htmely/htmlConverter.dart';
import 'package:htmely/markdownNode.dart';
import 'package:htmely/mdType.dart';
import 'package:test/test.dart';

import 'testBase.dart';

class HtmlConverterTests extends TestBase {
  @override
  void run() {
    group('HtmlConverter', () {
      test('convert() returns only html skeleton', () {
        final nodes = <MarkdownNode>[

        ];

        final converter = HtmlConverter(nodes);
        final expectedOutput = """
<!DOCTYPE html>
<html>
<head>
<title>Document</title>
</head>
<body>
</body>
</html>
""";

        expect(converter.convert(), equals(expectedOutput));
      });

      test('convert() returns expected HTML output', () {
        final nodes = [
          MarkdownNode(mdType: MdType.H1, content: 'Heading 1'),
          MarkdownNode(mdType: MdType.P, content: 'Paragraph content'),
          MarkdownNode(mdType: MdType.ULI, content: 'List item 1'),
          MarkdownNode(mdType: MdType.H2, content: 'Heading 2'),
          MarkdownNode(mdType: MdType.OLI, content: 'Ordered list item 1'),
          MarkdownNode(mdType: MdType.H3, content: 'Heading 3'),
        ];

        final converter = HtmlConverter(nodes);
        final expectedOutput = """
<!DOCTYPE html>
<html>
<head>
<title>Document</title>
</head>
<body>
<h1> Heading 1 </h1>
<p>
Paragraph content
</p>
<ul>
<li> List item 1 </li>
</ul>
<h2> Heading 2 </h2>
<ol>
<li> Ordered list item 1 </li>
</ol>
<h3> Heading 3 </h3>
</body>
</html>
""";

        expect(converter.convert(), equals(expectedOutput));
      });

      test('convert() produzes unordered list', () {
        final nodes = [
          MarkdownNode(mdType: MdType.ULI, content: 'First'),
          MarkdownNode(mdType: MdType.ULI, content: 'Second'),
          MarkdownNode(mdType: MdType.ULI, content: 'Third')
        ];

        final converter = HtmlConverter(nodes);
        final String expectedOutput = """
<!DOCTYPE html>
<html>
<head>
<title>Document</title>
</head>
<body>
<ul>
<li> First </li>
<li> Second </li>
<li> Third </li>
</ul>
</body>
</html>
""";

      expect(converter.convert(), equals(expectedOutput));
      });

      test('convert() produzes ordered list', (){
        final nodes = [
          MarkdownNode(mdType: MdType.OLI, content: 'First'),
          MarkdownNode(mdType: MdType.OLI, content: 'Second'),
          MarkdownNode(mdType: MdType.OLI, content: 'Third')
        ];

        final converter = HtmlConverter(nodes);
        final String expectedOutput = """
<!DOCTYPE html>
<html>
<head>
<title>Document</title>
</head>
<body>
<ol>
<li> First </li>
<li> Second </li>
<li> Third </li>
</ol>
</body>
</html>
""";

      expect(converter.convert(), equals(expectedOutput));
      });

      test('convert() produces paragraph', () {
        final nodes = <MarkdownNode>[
          MarkdownNode(mdType: MdType.P, content:"This is a sentence"),
          MarkdownNode(mdType: MdType.P, content:"This is a sentence"),
          MarkdownNode(mdType: MdType.P, content:"This is a sentence")
        ];

        final converter = HtmlConverter(nodes);
        final String expectedOutput = """
<!DOCTYPE html>
<html>
<head>
<title>Document</title>
</head>
<body>
<p>
This is a sentence
This is a sentence
This is a sentence
</p>
</body>
</html>
""";

      expect(converter.convert(), equals(expectedOutput));
      });

      test('convert() produces all heading types', () {
        final nodes = <MarkdownNode>[
          MarkdownNode(mdType: MdType.H1, content: "Heading 1"),
          MarkdownNode(mdType: MdType.H2, content: "Heading 2"),
          MarkdownNode(mdType: MdType.H3, content: "Heading 3"),
        ];

        final converter = HtmlConverter(nodes);
        final String expected = """
<!DOCTYPE html>
<html>
<head>
<title>Document</title>
</head>
<body>
<h1> Heading 1 </h1>
<h2> Heading 2 </h2>
<h3> Heading 3 </h3>
</body>
</html>
""";

      expect(converter.convert(), equals(expected));
      });

    });
  }
}
