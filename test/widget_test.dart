// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init hive box
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // test hivebox open and close
  test('hivebox open and close', () async {
    var box = await Hive.openBox('test');
    expect(box.isOpen, true);
    box.put('readingIndex', 2);
    var readingIndex = box.get('readingIndex') ?? 0;

    expect(readingIndex, 0);
    box.close();
    expect(box.isOpen, false);
  });
}
