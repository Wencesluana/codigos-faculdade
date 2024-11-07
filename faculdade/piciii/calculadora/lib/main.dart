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
          title: const Text('Calculadora calculativa'),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _result = '';

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  

void _calculate(String operator) {
  if (_controller1.text.isEmpty || _controller2.text.isEmpty) {
    setState(() {
      _result = 'Por favor, preencha todos os campos.';
    });
  } else {
    setState(() {
      _num1 = double.tryParse(_controller1.text) ?? 0.0;
      _num2 = double.tryParse(_controller2.text) ?? 0.0;

      switch (operator) {
        case '+':
          _result = (_num1 + _num2).toString();
          break;
        case '-':
          _result = (_num1 - _num2).toString();
          break;
        case '*':
          _result = (_num1 * _num2).toString();
          break;
        case '/':
          _result = _num2 != 0 ? (_num1 / _num2).toString() : 'Erro: Divisão por zero';
          break;
      }
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                    labelText: 'Digite um valor: ',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16), // Espaço entre os campos
              Expanded(
                child: TextField(
                  controller: _controller2,
                  decoration: const InputDecoration(
                    labelText: 'Digite outro valor:',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
           const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => _calculate('+'),
                icon: const Icon(Icons.add, size: 32),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  textStyle: const TextStyle(fontSize: 32),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _calculate('-'),
                icon: const Icon(Icons.remove, size: 32),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  textStyle: const TextStyle(fontSize: 32),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _calculate('*'),
                icon: const Icon(Icons.close, size: 32),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  textStyle: const TextStyle(fontSize: 32),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _calculate('/'),
                icon: const Icon(Icons.horizontal_rule, size: 32),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  textStyle: const TextStyle(fontSize: 32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'O resultado da operação é: $_result',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
