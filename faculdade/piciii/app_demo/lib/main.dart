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
          title: Text("Lista dinâmica de compras"),
          ),
        body: MyHomePage(),
        )
      );
   }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _values = [];
  final TextEditingController _textController = TextEditingController();

  void _addValue() {
    final String text = _textController.text;
    if (text.isNotEmpty){
      setState(() {
        _values.add(text);
    });
    _textController.clear();
  }
}

  void _removerValue(int index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Digite o item a ser comprado',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addValue,
           child: const Text('Adicionar a lista de compras'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _values.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_values[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removerValue(index),
                    ),
                );
              }))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
