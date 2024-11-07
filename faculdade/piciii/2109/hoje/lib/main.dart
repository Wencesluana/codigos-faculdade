import 'package:flutter/material.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de SnackBar',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exemplo de SnackBar'),
        ),
        body: const SnackBarExemplo(),
      ),
    );
  }
}
 
class SnackBarExemplo extends StatelessWidget {
  const SnackBarExemplo({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
                content: const Text('Este é um snackbar'),
                action: SnackBarAction(label: 'Desfazer', onPressed: () {}
                    //acao quando clicado o desfaze
                    ));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Exibir Snackbar')),
    );
  }
}