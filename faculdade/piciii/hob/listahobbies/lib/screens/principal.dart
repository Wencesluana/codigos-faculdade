import 'dart:async'; // para verificar horario
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listahobbies/screens/criar.dart';
import 'package:listahobbies/style/estilo.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> hobbies = [];
  List<double> progresso = [];
  Timer? _timer; 

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(minutes: 1), (timer) { //controle para verificar de minuto em minuto
      verificarLembretes();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  } //cancela quando fecha

  void adicionarOuEditarHobby({Map<String, dynamic>? hobby, int? index}) async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddHobbyPage(
          hobby: hobby,
        ),
      ),
    );

    if (resultado != null) {
      setState(() {
        if (index != null) {
          hobbies[index] = resultado;
        } else {
          hobbies.add(resultado);
          progresso.add(0.0); //aqui começa com marcação 0 de progresso
        }
      });
    }
  }
//tentativa de função para lembrete
//espero que funcione
  void verificarLembretes() {
    final DateTime agora = DateTime.now();
    for (var hobby in hobbies) {
      if (hobby['lembrete'] != null &&
          hobby['lembrete'].isAfter(agora.subtract(Duration(minutes: 1))) &&
          hobby['lembrete'].isBefore(agora.add(Duration(minutes: 1)))) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Hora de por em prática esse hobby: ${hobby['titulo']}!'),
        ));
      }
    }
  }

  void atualizarProgresso(int index) {
    setState(() {
      progresso[index] = (progresso[index] + 0.25).clamp(0.0, 1.0); 
    });
  } //atualizando o progresso

  void excluirHobby(int index) {
    setState(() {
      hobbies.removeAt(index);
      progresso.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Hobbies', style:TextStyle(color: Color(0xFFF0F0F0))),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: hobbies.isEmpty
              ? Text('Nenhum hobby adicionado.', style: AppColors.subtitulo)
              : ListView.builder(
                  itemCount: hobbies.length,
                  itemBuilder: (context, index) {
                    final hobbyCompleto = progresso[index] == 1.0;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 4,
                        child: ListTile(
                          onTap: () => adicionarOuEditarHobby(hobby: hobbies[index], index: index),
                          leading: CircularProgressIndicator(
                            value: progresso[index],
                            strokeWidth: 8,
                            backgroundColor: AppColors.cinzaMedio,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                hobbyCompleto ? AppColors.verdeMentaEscuro : AppColors.azulCalmo),
                          ),
                          title: Text(
                            hobbies[index]['titulo'],
                            style: hobbyCompleto
                                ? AppColors.titulo.copyWith(decoration: TextDecoration.lineThrough)
                                : AppColors.titulo,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Descrição: ${hobbies[index]['descricao']}',
                                style: hobbyCompleto
                                    ? AppColors.descricao.copyWith(
                                        decoration: TextDecoration.lineThrough)
                                    : AppColors.descricao,
                              ),
                              Text(
                                'Frequência: ${hobbies[index]['frequencia']}',
                                style: hobbyCompleto
                                    ? AppColors.descricao.copyWith(
                                        decoration: TextDecoration.lineThrough)
                                    : AppColors.descricao,
                              ),
                              Text(
                                'Categoria: ${hobbies[index]['categoria']}',
                                style: hobbyCompleto
                                    ? AppColors.descricao.copyWith(
                                        decoration: TextDecoration.lineThrough)
                                    : AppColors.descricao,
                              ),
                              Text(
                                'Ideias: ${hobbies[index]['ideia']}',
                                style: hobbyCompleto
                                    ? AppColors.descricao.copyWith(
                                        decoration: TextDecoration.lineThrough)
                                    : AppColors.descricao,
                              ),
                              if (hobbies[index]['lembrete'] != null)
                                Text(
                                  'Lembrete: ${DateFormat('dd/MM/yyyy HH:mm').format(hobbies[index]['lembrete'])}',
                                  style: hobbyCompleto
                                      ? AppColors.descricao.copyWith(
                                          decoration: TextDecoration.lineThrough)
                                      : AppColors.descricao,
                                ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.delete, color: AppColors.rosaPalidoEscuro),
                                onPressed: () => excluirHobby(index),
                              ),
                              ElevatedButton(
                                onPressed: () => atualizarProgresso(index),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.verdeMenta,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                ),
                                child: Text('Progresso'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => adicionarOuEditarHobby(),
        child: Icon(Icons.add),
      ),
    );
  }
}
