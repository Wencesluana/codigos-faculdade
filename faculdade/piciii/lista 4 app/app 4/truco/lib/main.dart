import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Marcador de Truco',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _placar1 = 0;
  int _placar2 = 0;

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  Future<void> _loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _placar1 = prefs.getInt('placar1') ?? 0;
      _placar2 = prefs.getInt('placar2') ?? 0;
    });
  }

  Future<void> _saveScores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('placar1', _placar1);
    await prefs.setInt('placar2', _placar2);
  }

  void _incrementplacar1(int increment) {
    setState(() {
      _placar1 = (_placar1 + increment).clamp(0, 12);
    });
    _saveScores();
    _checkForWin();
  }

  void _incrementplacar2(int increment) {
    setState(() {
      _placar2 = (_placar2 + increment).clamp(0, 12);
    });
    _saveScores();
    _checkForWin();
  }

  void _checkForWin() async {
  if (_placar1 == 12 || _placar2 == 12) {
    String vencedor = _placar1 == 12 ? 'Time 1' : 'Time 2';
    
    await _resetScores();  

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => vitoria(vencedor: vencedor)),
    );
  }
}

  Future<void> _resetScores() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _placar1 = 0;
      _placar2 = 0;
    });
    await prefs.remove('placar1');
    await prefs.remove('placar2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador de Truco'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Time 1', style: TextStyle(fontSize: 24)),
                    Text(
                      '$_placar1',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () => _incrementplacar1(1),
                      child: const Text('+1 ponto'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _incrementplacar1(3),
                      child: const Text('+3 pontos'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _incrementplacar1(-1),
                      child: const Text('-1 ponto'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Time 2', style: TextStyle(fontSize: 24)),
                    Text(
                      '$_placar2',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () => _incrementplacar2(1),
                      child: const Text('+1 ponto'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _incrementplacar2(3),
                      child: const Text('+3 pontos'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _incrementplacar2(-1),
                      child: const Text('-1 ponto'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _resetScores,
              child: const Text('Resetar'),
            ),
          ],
        ),
      ),
    );
  }
}

class vitoria extends StatelessWidget {
  final String vencedor;
  const vitoria({required this.vencedor, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fim de jogo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              vencedor == 'Time 1' ? 'Vitória para Time 1!' : 'Vitória para Time 2!',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
