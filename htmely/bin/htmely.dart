import 'package:htmely/functions.dart' as htmely;

mixin EmptyMixin on Map<String, String> {
  static Map<String, String> empty () => {};
}

typedef CliArgs = Map<String, String>;

CliArgs parseArgs(List<String> args) {
  for (var i = 0; i < args.length; i++) {
    
  }
  return CliArgs.from({});
}

void main(List<String> arguments) {
  final Map<String, String> args = parseArgs(arguments);

}
