import 'package:flutter/material.dart';
import 'package:flutter_alura_bytebank_curso2/database/app_database.dart';
import 'package:flutter_alura_bytebank_curso2/screens/dashboard.dart';

void main() {
  runApp(ByteBankApp());
    findAll().then((value) => debugPrint(value.toString()));
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: DashBoardWidget(),
    );
  }
}
