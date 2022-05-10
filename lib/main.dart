import 'dart:io';

import 'package:flutter/material.dart';

import 'components.dart';
import 'models/userconf_model.dart';
import 'ui/reading/home_page.dart';

void main() {
  var path = Directory.current.path;
  Hive..init(path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'القرآن الكريم',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PageScreen(),
      ),
    );
  }
}
