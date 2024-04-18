import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/pages/primeira_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeiraTela(),
    );
  }
}
