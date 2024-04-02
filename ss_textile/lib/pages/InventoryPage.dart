import 'package:flutter/material.dart';
import 'package:ss_textile/DataClass/Product.dart';
import 'package:ss_textile/commonWidget/Appbar.dart';
import 'package:ss_textile/db/FirestoreService.dart';
import 'package:ss_textile/pages/ProductType.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final FirestoreService _firestoreService = FirestoreService();
  List<MapEntry<ProductType, double>> _productTypesWithTotalWeights = [];

  @override
  void initState() {
    super.initState();

    _fetchProductTypesWithTotalWeights(); // Fetch product types with total weights when page initializes
  }

  Future<void> _fetchProductTypesWithTotalWeights() async {
    List<MapEntry<ProductType, double>> productTypesWithTotalWeights =
        await _firestoreService.getProductTypesWithTotalWeights();
    setState(() {
      _productTypesWithTotalWeights = productTypesWithTotalWeights;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Inventory"),
      backgroundColor: Color.fromARGB(255, 245, 242, 234),
      body: ListView.builder(
        itemCount: _productTypesWithTotalWeights.length,
        itemBuilder: (context, index) {
          final entry = _productTypesWithTotalWeights[index];
          final productType = entry.key;
          final totalWeight = entry.value;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  productType.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Total Weight: $totalWeight KG',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
