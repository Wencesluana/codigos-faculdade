import 'package:flutter/material.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Outro Exemplo de SnackBar',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exemplo de SnackBar com Texto de'
        ),
      ),
      body: SnackBarEntrada(),
    ));
  }
}
 
 
class SnackBarEntrada extends StatefulWidget {
  const SnackBarEntrada({super.key});
 
  @override
  State<SnackBarEntrada> createState() => _SnackBarEntradaState();
}
 
class _SnackBarEntradaState extends State<SnackBarEntrada> {
  final TextEditingController _controller = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          TextField(controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Digite sua mensagem aqui',
            border: OutlineInputBorder(),
          ),),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            final userMessage = _controller.text;
            if(userMessage.isNotEmpty){
              final snackBar = SnackBar(
                content: Text(userMessage),
                action: SnackBarAction(label: 'Desfazer', onPressed: (){}),
              );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Por favor digite alguma coisa"),
              ));
            }
          }, child: const Text('Mostrar snackbar'))
      ],
    ),
    );
  }
}