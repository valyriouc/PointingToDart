import "package:htmely/markdownNode.dart";
import "package:htmely/mdType.dart";

final class Todo {
  final String what;

  const Todo(this.what);
}

enum HtmlTag {
  H1,
  H2,
  H3,
  UL,
  OL,
  P;

  String getStarting() => switch (this) {
    HtmlTag.H1 => "<h1>",
    HtmlTag.H2 => "<h2>",
    HtmlTag.H3 => "<h3>",
    HtmlTag.UL => "<ul>",
    HtmlTag.OL => "<ol>",
    HtmlTag.P => "<p>",

  };

  String getClosing() => switch (this) {
    HtmlTag.H1 => "</h1>",
    HtmlTag.H2 => "</h2>",
    HtmlTag.H3 => "</h3>",
    HtmlTag.UL => "</ul>",
    HtmlTag.OL => "</ol>",
    HtmlTag.P => "</p>",
  };

  static HtmlTag fromMd(MarkdownNode node) => switch (node.mdType) {
    MdType.H1 => HtmlTag.H1,
    MdType.H2 => HtmlTag.H2,
    MdType.H3 => HtmlTag.H3,
    MdType.OLI => HtmlTag.OL,
    MdType.ULI => HtmlTag.UL,
    MdType.P => HtmlTag.P,
  };
}

class HtmlConverter {
  static const String template = """
<!DOCTYPE html>
<html>
<head>
<title>Document</title>
</head>
<body>
""";

  static const String end = """
</body>
</html>
""";

  final Iterable<MarkdownNode> nodes;

  HtmlConverter(this.nodes);

  String convert() {
    final StringBuffer buf = StringBuffer(template);

    Iterator<MarkdownNode> enumerator = nodes.iterator;

    if (!enumerator.moveNext()) {
      buf.write(end);
      return buf.toString();
    }
    
    MarkdownNode last = enumerator.current;
    openIfNeeded(last, MarkdownNode(mdType: MdType.H1, content: ""), buf);
    write(last, buf);

    while(enumerator.moveNext()) {
      var current = enumerator.current;
      closeIfNeeded(current, last, buf);
      openIfNeeded(current, last, buf);
      write(current, buf);
      last = current;
    }

    buf.write(end);
    return buf.toString();
  }

  void openIfNeeded(MarkdownNode cur, MarkdownNode last, StringBuffer buf) {
    if (cur.mdType != last.mdType) {
      if (cur.mdType == MdType.OLI || cur.mdType == MdType.ULI || cur.mdType == MdType.P) {
        buf.writeln(HtmlTag.fromMd(cur).getStarting());
      }
    }
  }

  void write(MarkdownNode node, StringBuffer buf) {
    HtmlTag tag = HtmlTag.fromMd(node);
    if (tag == HtmlTag.H1 || tag == HtmlTag.H2 || tag == HtmlTag.H3) {
      buf.writeln("${tag.getStarting()} ${node.content} ${tag.getClosing()}");
    }
    else if (tag == HtmlTag.OL || tag == HtmlTag.UL) {
      buf.writeln("<li> ${node.content} </li>");
    }
    else {
      buf.writeln(node.content);
    }
  }

  void closeIfNeeded(MarkdownNode current, MarkdownNode last, StringBuffer buf) {
    if (current.mdType != last.mdType) {
      if (last.mdType == MdType.OLI || last.mdType == MdType.ULI || last.mdType == MdType.P) {
        buf.writeln(HtmlTag.fromMd(last).getClosing());
      }
    }
  }
}