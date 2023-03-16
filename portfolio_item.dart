import 'package:flutter/material.dart';

class PortfolioItem {
  final String name;
  final double price;

  PortfolioItem({required this.name, required this.price});
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final List<PortfolioItem> _portfolioItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: const Center(
        child: Text('Hello, world!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPortfolioItem,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addPortfolioItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController priceController = TextEditingController();
        return AlertDialog(
          title: const Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: priceController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                double price = double.tryParse(priceController.text) ?? 0.0;
                if (name.isNotEmpty && price > 0) {
                  setState(() {
                    _portfolioItems
                        .add(PortfolioItem(name: name, price: price));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
