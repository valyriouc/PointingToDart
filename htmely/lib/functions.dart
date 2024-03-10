import "package:htmely/markdownNode.dart";
import "package:htmely/mdType.dart";


MarkdownNode toMarkdownNode(String line)  {
  if (line.startsWith("# ")) {
    return MarkdownNode(mdType: MdType.H1, content: line.substring(1).trim());
  }
  if (line.startsWith("## ")) {
    return MarkdownNode(mdType: MdType.H2, content: line.substring(2).trim());
  }
  if (line.startsWith("### ")) {
    return MarkdownNode(mdType: MdType.H3, content: line.substring(3).trim());
  }
  if (line.startsWith("*") || line.startsWith("-")) {
    return MarkdownNode(mdType: MdType.ULI, content: line.substring(1).trim());
  }
  if (int.tryParse(line[0]) != null) {
    int index = line.indexOf(".");
    return MarkdownNode(mdType: MdType.OLI, content: line.substring(index+1).trim());
  }

  return MarkdownNode(mdType: MdType.P, content: line);
}