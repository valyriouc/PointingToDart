import "package:htmely/markdownNode.dart";
import "package:htmely/mdType.dart";


MarkdownNode toMarkdownNode(String line)  {
  if (line.startsWith("# ")) {
    return MarkdownNode(MdType.H1, line.substring(1).trim());
  }
  if (line.startsWith("## ")) {
    return MarkdownNode(MdType.H2, line.substring(2).trim());
  }
  if (line.startsWith("### ")) {
    return MarkdownNode(MdType.H3, line.substring(3).trim());
  }
  if (line.startsWith("*") || line.startsWith("-")) {
    return MarkdownNode(MdType.ULI, line.substring(1).trim());
  }
  if (int.tryParse(line[0]) != null) {
    int index = line.indexOf(".");
    return MarkdownNode(MdType.OLI, line.substring(index+1).trim());
  }

  return MarkdownNode(MdType.P, line);
}