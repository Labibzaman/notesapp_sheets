import 'package:flutter/material.dart';
import 'package:notesapp_sheets/gsheet_api/gsheets_api.dart';
import 'HomeScreen/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GsheetApi().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
      ),
    );
  }
}
