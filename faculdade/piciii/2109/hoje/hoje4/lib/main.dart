import 'package:flutter/material.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de layou Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LayoutDemo(),
    );
  }
}
 
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo de Layout'),
      ),
      body: ListView(
        children: [
         Image.asset(
            'assets/images/paisagem.jpeg',
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
          tituloSecao,
          buttonAcao(context),
          textoSecao,
        ],
      ),
    );
  }
}
 
Widget tituloSecao = Container(
  padding: const EdgeInsets.all(20),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Text(
                'Primeiro texto',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Text(
              'Segundo texto',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      const Icon(
        Icons.star,
        color: Colors.red,
      ),
      const Text('33'),
    ],
  ),
);
 
Widget buttonAcao(context) {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [Icon(Icons.call), Text("Call")],
      ),
      Column(
        children: [Icon(Icons.near_me), Text("Rota")],
      ),
      Column(
        children: [Icon(Icons.share), Text("Call")],
      ),
    ],
  );
}
 
Widget textoSecao = const Padding(
  padding: EdgeInsets.all(20),
  child: Text(
    'Texto qualquer Texo qualquerTexo qualquerTexo qualquerTexo qualquer'
    'Texto qualquer Texo qualquerTexo qualquerTexo qualquerTexo qualquer'
    'Texto qualquer Texo qualquerTexo qualquerTexo qualquerTexo qualquer'
    'Texto qualquer Texo qualquerTexo qualquerTexo qualquerTexo qualquer'
    'Texto qualquer Texo qualquerTexo qualquerTexo qualquerTexo qualquer',
    softWrap: true,
  ),
);