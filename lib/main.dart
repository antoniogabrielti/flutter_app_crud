import 'package:flutter/material.dart';
import 'package:flutter_app_crud/ui/Tela.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Tela(title: 'Flutter Demo Home Page'),
    );
  }
}

