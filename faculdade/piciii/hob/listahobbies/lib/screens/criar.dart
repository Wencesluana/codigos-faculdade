import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listahobbies/style/estilo.dart';  
import 'package:flutter/scheduler.dart'; // addPostFrameCallback

class AddHobbyPage extends StatefulWidget {
  final Map<String, dynamic>? hobby;

  const AddHobbyPage({super.key, this.hobby});

  @override
  _AddHobbyPageState createState() => _AddHobbyPageState();
}

class _AddHobbyPageState extends State<AddHobbyPage> {
  late TextEditingController _tituloController;
  late TextEditingController _descricaoController;
  late TextEditingController _ideiaController;
  String? _frequenciaSelecionada;
  String? _categoriaSelecionada;
  DateTime? _dataLembrete;

  @override
  void initState() {
    super.initState();

    _tituloController = TextEditingController(text: widget.hobby?['titulo'] ?? '');
    _descricaoController = TextEditingController(text: widget.hobby?['descricao'] ?? '');
    _ideiaController = TextEditingController(text: widget.hobby?['ideia'] ?? '');
    _frequenciaSelecionada = widget.hobby?['frequencia'];
    _categoriaSelecionada = widget.hobby?['categoria'];
    _dataLembrete = widget.hobby?['lembrete'];
  }

  Future<void> _selecionarDataHora() async {
    final DateTime? selecionaData = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (selecionaData != null) {
      final TimeOfDay? selecionaHora = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (selecionaHora != null) {
        setState(() {
          _dataLembrete = DateTime(
            selecionaData.year,
            selecionaData.month,
            selecionaData.day,
            selecionaHora.hour,
            selecionaHora.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hobby != null ? 'Editar Hobby' : 'Adicionar Hobby'),
        backgroundColor: AppColors.azulCalmoEscuro, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Título do hobby',
                labelStyle: AppColors.titulo, 
                border: OutlineInputBorder(),
              ),
              style: AppColors.titulo, 
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição do hobby',
                labelStyle: AppColors.titulo, 
                border: OutlineInputBorder(),
              ),
              style: AppColors.titulo,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _ideiaController,
              decoration: InputDecoration(
                labelText: 'Ideias para o hobby',
                labelStyle: AppColors.titulo, 
                border: OutlineInputBorder(),
              ),
              style: AppColors.titulo,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _frequenciaSelecionada,
              onChanged: (String? newValue) {
                setState(() {
                  _frequenciaSelecionada = newValue;
                });
              },
              items: <String>['Diário', 'Semanal', 'Mensal']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Frequência',
                labelStyle: AppColors.titulo, 
                border: OutlineInputBorder(),
              ),
              style: AppColors.titulo,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _categoriaSelecionada,
              onChanged: (String? newValue) {
                setState(() {
                  _categoriaSelecionada = newValue;
                });
              },
              items: <String>['Esportivo', 'Artístico', 'Educativo', 'Recreativo']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Categoria',
                labelStyle: AppColors.titulo, 
                border: OutlineInputBorder(),
              ),
              style: AppColors.titulo,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _selecionarDataHora,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.verdeMenta, 
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('Definir Lembrete'),
                ),

                if (_dataLembrete != null)
                  Text('Lembrete: ${DateFormat('dd/MM/yyyy HH:mm').format(_dataLembrete!)}'),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0), 
              child: SizedBox(
                width: 150,
                //TextTheme: TextStyle(color: Colors.white),
                child: ElevatedButton(
                  onPressed: () {
                    if (_tituloController.text.isNotEmpty &&
                        _descricaoController.text.isNotEmpty &&
                        _frequenciaSelecionada != null &&
                        _categoriaSelecionada != null &&
                        _ideiaController.text.isNotEmpty) {
                      Navigator.pop(context, {
                        'titulo': _tituloController.text,
                        'descricao': _descricaoController.text,
                        'frequencia': _frequenciaSelecionada,
                        'categoria': _categoriaSelecionada,
                        'ideia': _ideiaController.text,
                        'lembrete': _dataLembrete,
                      });

                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Hobby adicionado com sucesso!')),
                        );
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.rosaPalidoEscuro, 
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    textStyle: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  child: Text(widget.hobby != null ? 'Salvar' : 'Adicionar'), 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}