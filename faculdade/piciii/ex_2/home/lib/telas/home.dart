import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Esta é a tela inicial'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/calculadora');
              },
              child: const Text('Ir para a Calculadora'),
            ),
          ],
        ),
      ),
    );
  }
}