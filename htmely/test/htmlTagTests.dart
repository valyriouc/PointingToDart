
import 'package:htmely/htmlConverter.dart';
import 'package:htmely/markdownNode.dart';
import 'package:htmely/mdType.dart';
import 'package:test/test.dart';

import 'testBase.dart';

class HtmlTagTests extends TestBase {
  @override void run() {
    group('HtmlTag', () {
    test('getStarting() returns correct opening tag', () {
      expect(HtmlTag.H1.getStarting(), equals('<h1>'));
      expect(HtmlTag.H2.getStarting(), equals('<h2>'));
      expect(HtmlTag.H3.getStarting(), equals('<h3>'));
      expect(HtmlTag.UL.getStarting(), equals('<ul>'));
      expect(HtmlTag.OL.getStarting(), equals('<ol>'));
      expect(HtmlTag.P.getStarting(), equals('<p>'));
    });

    test('getClosing() returns correct closing tag', () {
      expect(HtmlTag.H1.getClosing(), equals('</h1>'));
      expect(HtmlTag.H2.getClosing(), equals('</h2>'));
      expect(HtmlTag.H3.getClosing(), equals('</h3>'));
      expect(HtmlTag.UL.getClosing(), equals('</ul>'));
      expect(HtmlTag.OL.getClosing(), equals('</ol>'));
      expect(HtmlTag.P.getClosing(), equals('</p>'));
    });

    test('fromMd() converts MarkdownNode to HtmlTag', () {
      final h1Node = MarkdownNode(mdType: MdType.H1, content: "");
      final h2Node = MarkdownNode(mdType: MdType.H2, content: "");
      final h3Node = MarkdownNode(mdType: MdType.H3, content: "");
      final oliNode = MarkdownNode(mdType: MdType.OLI, content: "");
      final uliNode = MarkdownNode(mdType: MdType.ULI, content: "");
      final pNode = MarkdownNode(mdType: MdType.P, content: "");

      expect(HtmlTag.fromMd(h1Node), equals(HtmlTag.H1));
      expect(HtmlTag.fromMd(h2Node), equals(HtmlTag.H2));
      expect(HtmlTag.fromMd(h3Node), equals(HtmlTag.H3));
      expect(HtmlTag.fromMd(oliNode), equals(HtmlTag.OL));
      expect(HtmlTag.fromMd(uliNode), equals(HtmlTag.UL));
      expect(HtmlTag.fromMd(pNode), equals(HtmlTag.P));
    });
  });
  }
}