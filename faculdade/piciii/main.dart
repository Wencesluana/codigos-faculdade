import 'package:flutter/material.dart'

void main() {
    runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @Overridade
    Widget build(BuildContext context) {
        return MaterialApp( //conjunto de widgets, temas e fontes para desenvolvimento da aplicação
            home: Scaffold(
                appBar: appBar(
                    title: const Text("Ola, meu app"),
                    ), //appbar
                //body: const("ola mundo"),
                body: const Center(
                    child: Text("ola mundo!"),),
            ), //scaffold
        ); //material app
    }

}