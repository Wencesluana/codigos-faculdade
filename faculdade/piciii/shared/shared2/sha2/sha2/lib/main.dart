import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences List Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _savedTexts = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedTexts();
  }

  // Carrega a lista de textos salvos
  void _loadSavedTexts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedTexts = prefs.getStringList('savedTexts') ?? [];
    });
  }

  // Salva o texto na lista e armazena nas SharedPreferences
  void _saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedTexts.add(text);
    await prefs.setStringList('savedTexts', _savedTexts);
    setState(() {});
  }

  // Limpa todos os textos salvos
  void _clearTexts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('savedTexts');
    setState(() {
      _savedTexts = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences List Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearTexts, // Limpa todos os textos
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Digite algo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveText(_controller.text);
                _controller.clear();
              },
              child: const Text('Salvar texto'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _savedTexts.isEmpty
                  ? const Text('Nenhum texto salvo!')
                  : ListView.builder(
                      itemCount: _savedTexts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_savedTexts[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
