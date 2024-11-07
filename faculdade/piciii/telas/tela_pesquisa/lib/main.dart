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
          title: const Text('Consulta de Vendas'),
        ),
        body: const SalesConsultationPage(),
      ),
    );
  }
}

class SalesConsultationPage extends StatefulWidget {
  const SalesConsultationPage({super.key});

  @override
  _SalesConsultationPageState createState() => _SalesConsultationPageState();
}

class _SalesConsultationPageState extends State<SalesConsultationPage> {
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  
  // Simulação de dados de vendas
  final List<Map<String, dynamic>> _salesData = [
    {
      'venda': '001',
      'data': '2024-09-10',
      'pagamento': 'Cartão de Crédito',
      'itens': [
        {'codigo': '123456', 'nome': 'Produto A', 'valor': 50.00, 'quantidade': 2, 'subtotal': 100.00},
        {'codigo': '789012', 'nome': 'Produto B', 'valor': 30.00, 'quantidade': 1, 'subtotal': 30.00},
      ],
      'desconto': 10.00,
      'acrescimo': 5.00,
      'total': 125.00,
    },
    {
      'venda': '002',
      'data': '2024-09-11',
      'pagamento': 'Dinheiro',
      'itens': [
        {'codigo': '345678', 'nome': 'Produto C', 'valor': 20.00, 'quantidade': 3, 'subtotal': 60.00},
        {'codigo': '901234', 'nome': 'Produto D', 'valor': 15.00, 'quantidade': 2, 'subtotal': 30.00},
      ],
      'desconto': 5.00,
      'acrescimo': 0.00,
      'total': 85.00,
    },
  ];

  Map<String, dynamic>? _selectedSale; // Para armazenar a venda selecionada

  void _searchSales() {
    // Implementação de pesquisa com base no cliente e datas (aqui estamos apenas simulando)
    // Você pode implementar uma busca real a partir de uma API ou banco de dados
    setState(() {
      // Selecionar a primeira venda para exibir os detalhes como simulação
      _selectedSale = _salesData.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo no centro do topo
          Center(
            child: Image.network(
              'https://via.placeholder.com/150', // Substitua pela URL do seu logo
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 20),

          // Campo de pesquisa (nome do cliente)
          TextField(
            controller: _clientController,
            decoration: const InputDecoration(
              labelText: 'Nome do Cliente',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),

          // Campos de data
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _startDateController,
                  decoration: const InputDecoration(
                    labelText: 'Data Inicial',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      _startDateController.text = pickedDate.toIso8601String().split('T').first;
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _endDateController,
                  decoration: const InputDecoration(
                    labelText: 'Data Final',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      _endDateController.text = pickedDate.toIso8601String().split('T').first;
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Botão para buscar
          Center(
            child: ElevatedButton(
              onPressed: _searchSales,
              child: const Text('Buscar'),
            ),
          ),
          const SizedBox(height: 20),

          // Lista de vendas filtradas (Simulação)
          Expanded(
            child: ListView.builder(
              itemCount: _salesData.length,
              itemBuilder: (context, index) {
                final sale = _salesData[index];
                return ListTile(
                  title: Text('Venda: ${sale['venda']}'),
                  subtitle: Text('Data: ${sale['data']} - Pagamento: ${sale['pagamento']}'),
                  onTap: () {
                    setState(() {
                      _selectedSale = sale;
                    });
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Detalhes do pedido selecionado
          if (_selectedSale != null) ...[
            const Text(
              'Detalhes do Pedido',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DataTable(
              columns: const [
                DataColumn(label: Text('Código de Barra')),
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Valor Unitário')),
                DataColumn(label: Text('Quantidade')),
                DataColumn(label: Text('Subtotal')),
              ],
              rows: _selectedSale!['itens'].map<DataRow>((item) {
                return DataRow(
                  cells: [
                    DataCell(Text(item['codigo'].toString())),
                    DataCell(Text(item['nome'].toString())),
                    DataCell(Text(item['valor'].toStringAsFixed(2))),
                    DataCell(Text(item['quantidade'].toString())),
                    DataCell(Text(item['subtotal'].toStringAsFixed(2))),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Total da compra e detalhes adicionais
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Desconto: R\$${_selectedSale!['desconto'].toStringAsFixed(2)}'),
                Text('Acréscimo: R\$${_selectedSale!['acrescimo'].toStringAsFixed(2)}'),
                Text('Total: R\$${_selectedSale!['total'].toStringAsFixed(2)}'),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
