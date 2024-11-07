import 'package:flutter/material.dart';

void main(){
    runApp(const MyApp());
}

class MyApp extends StatelessWidget{
    const MyApp({super.key});

    @Override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: ClickCounter(),
        ); //materialapp
    }
}


class ClickCounter extends StatefulWidget {
    const ClickCounter({super.key});

    @Override
    State<ClickCounter > createState() => _ClickCounterState();
}
//_ define a classe como privada
class _ClickCounterState extends State<ClickCounter> {
    int = _contador = 0;

    void incrementar() {
        setState(() {
            _contador++;
        });
    }

    void decrementar() {
        setState(() {
            _contador--;
        });
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Contador de cliques'),
            ), //appbar
            body: Center(
                child: Column(
                    mainAxisAligment: mainAxisAligment.center,
                    children: [
                       const Text(
                            'Voce clicou aqui', 
                            style: TextStyle(fontSize: 18),
                        ),
                        Text(
                            '$_contador', 
                            style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        Row(
                            //verificar maiusculas e minusculas
                            mainAxisAligment: MainAxisAligment.center,
                            children: <Widget>[
                                ElevatedButton(
                                    onPressed: incrementar,
                                     child: const Text('incrementar')),
                                ElevatedButton(
                                    onPressed: decrementar, 
                                    child: const Text('decrementar'))
                            ],
                        ) //row
                    ], 
                ), //column
            ),
        ); //scaffold
    }
}