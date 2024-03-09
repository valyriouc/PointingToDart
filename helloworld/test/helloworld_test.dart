import "../lib/helloworld.dart" as helloworld;
import "package:test/test.dart";

void main() {
  test('calculate', () {
    expect(helloworld.calculate(), 42);
  });
}
