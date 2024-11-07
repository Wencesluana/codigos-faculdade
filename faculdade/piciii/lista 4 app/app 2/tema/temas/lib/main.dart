import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      dark: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Contador',
        theme: theme,
        darkTheme: darkTheme,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _initializeThemeBasedOnTime();
  }

  Future<void> _initializeThemeBasedOnTime() async {
    // Pega a hora atual
    final now = DateTime.now();
    // Define a lógica para definir o tema
    if (now.hour >= 6 && now.hour < 18) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
  }

  // Carrega o valor salvo do contador
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _saveCounter(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', value);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _saveCounter(_counter);
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    _saveCounter(_counter);
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _saveCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              AdaptiveTheme.of(context).toggleThemeMode();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Valor do contador:'),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decrementCounter,
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _resetCounter,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _incrementCounter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
