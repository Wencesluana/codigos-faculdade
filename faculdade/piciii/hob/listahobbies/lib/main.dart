import 'package:flutter/material.dart';
import 'screens/principal.dart';
import 'screens/criar.dart';
import 'style/estilo.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organizador de Hobbies',
      theme: appTheme(), 
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddHobbyPage(),
      },
    );
  }
}