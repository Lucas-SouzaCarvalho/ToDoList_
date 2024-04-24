import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/primeira_tela.dart';
import 'package:to_do_app/provider/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(
            create: (context) => TaskProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PrimeiraTela(),
      ),
    );
  }
}
