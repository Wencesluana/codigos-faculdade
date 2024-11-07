import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<CalculadoraScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
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
                const SizedBox(width: 16),
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
                ),
                ElevatedButton.icon(
                  onPressed: () => _calculate('-'),
                  icon: const Icon(Icons.remove, size: 32),
                  label: const Text(''),
                ),
                ElevatedButton.icon(
                  onPressed: () => _calculate('*'),
                  icon: const Icon(Icons.close, size: 32),
                  label: const Text(''),
                ),
                ElevatedButton.icon(
                  onPressed: () => _calculate('/'),
                  icon: const Icon(Icons.horizontal_rule, size: 32),
                  label: const Text(''),
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
      ),
    );
  }
}
