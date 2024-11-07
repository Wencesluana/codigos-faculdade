import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de filmes'),
        ),
        body: MyHomePage(),
        ),
      );
    }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});
   final List<String> _values = [
    'Uma questão de tempo',
    'Quarto de Guerra',
    'A Culpa é das Estrelas',
    'De volta para o futuro',
    'Um Faz de Conta que Acontece',
    'O Pequeno Príncipe'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _values.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(_values[index]),
        );
      });
  }
}