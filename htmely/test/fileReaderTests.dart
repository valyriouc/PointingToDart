import 'package:htmely/fileHandle.dart';
import 'package:test/test.dart';
import 'dart:io' as io;

import 'testBase.dart';

class FileHandleTests extends TestBase {
  @override
  void run() {
    _testsForRead();
  }

  void _testsForRead() {
    group('MarkdownReader', () {
    test('lineIter should split content into lines', () {
      final markdown = 'Line 1\nLine 2\nLine 3';
      final reader = FileHandle.fromMarkdown(markdown);

      final lines = reader
        .lineIter()
        .toList();

      expect(lines, ['Line 1', 'Line 2', 'Line 3']);
    });

    test('convertToIter should apply converter to each line', () {
      final markdown = '1\n2\n3';
      final reader = FileHandle.fromMarkdown(markdown);

      final numbers = reader.convertToIter<int>((line) => int.parse(line)).toList();

      expect(numbers, [1, 2, 3]);
    });

    test('fromFile should read content from a file', () async {
      final tempFile = await io.File('temp_test_file.txt').writeAsString('Hello\nWorld');
      final reader = await FileHandle.fromFile(tempFile.path);

      final lines = reader.lineIter().toList();

      expect(lines, ['Hello', 'World']);

      // Clean up the temporary file
      await tempFile.delete();
    });
  });
  }

  void _testsForWrite() {

  }
}