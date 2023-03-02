import 'package:flutter/material.dart';
import 'package:sqlite_crud/page/list_publication.dart';
import 'package:sqlite_crud/page/menu_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const ListPublication()
      home: const MenuNavigation(),
    );
  }
}
