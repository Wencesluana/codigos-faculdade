import 'package:flutter/material.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Valores'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}
 
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<String> _values = [
    'Valor 1',
    'Valor 2',
    'Valor 3',
    'Valor 4',
    'Valor 5',
  ];
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _values.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_values[index]),
          );
        });
  }
}