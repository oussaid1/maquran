import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'components.dart';
import 'ui/reading/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

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
