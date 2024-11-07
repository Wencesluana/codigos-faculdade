import 'package:flutter/material.dart';

import 'telas/calculadora.dart';
import 'telas/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      title: 'App com Calculadora',
      routes: {
        '/': (context) => const Home(),
        '/calculadora': (context) => const Calculadora(),
      },
    );
  }
}
