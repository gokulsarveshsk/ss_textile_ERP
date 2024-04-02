import 'package:flutter/material.dart';
import 'package:ss_textile/DataClass/Product.dart';
import 'package:ss_textile/commonWidget/Appbar.dart';
import 'package:ss_textile/db/FirestoreService.dart';

class ProductTypePage extends StatefulWidget {
  final ProductTypeData productTypeData;

  const ProductTypePage({Key? key, required this.productTypeData})
      : super(key: key);

  @override
  _ProductTypePageState createState() => _ProductTypePageState();
}

class _ProductTypePageState extends State<ProductTypePage> {
  final FirestoreService _firestoreService = FirestoreService();

  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProductsForProductType(); // Fetch products for the given product type
  }

  Future<void> _fetchProductsForProductType() async {
    List<Product> products = await _firestoreService.getProductsForProductType(widget.productTypeData.type);
    setState(() {
      _products = products;
    });
  }
  @override
  Widget build(BuildContext context) {
    Map<ProductType, String> productTypeTitles = {
    ProductType.thirtySemiCombed: "30's SemiCombed",
    ProductType.twentyFiveSemiCombed: "25's SemiCombed",
    ProductType.polyester: "Polyester",
  };
   Cart cart = Cart();
    return Scaffold(
      appBar: CustomAppBar(
          title: productTypeTitles[widget.productTypeData.type] ?? "Unknown"),
      backgroundColor: Color.fromARGB(255, 245, 242, 234),
      body: ListView.builder(
        itemCount: widget.productTypeData.products.length,
        itemBuilder: (context, index) {
          final product = widget.productTypeData.products[index];
          TextEditingController weightController =
              TextEditingController(text: product.weight.toString());
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity, // Full width for the image
                      height: 200, // Height for the image
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/25's.jpg"), // Replace with your image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Add vertical space
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}', // Display price with 2 decimal places
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Add vertical space
                    Text('Available Colors:'),
                    SizedBox(height: 4), // Add vertical space
                    if (product.availableColors != null)
                      DropdownButton<ColorType>(
                        value: product.color ??
                            product.availableColors!.first,
                        items: product.availableColors!
                            .map((color) {
                          return DropdownMenuItem<ColorType>(
                            value: color,
                            child: Text(color.toString().split('.').last),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            widget.productTypeData.products[index] =
                                Product(
                              name: product.name,
                              type: product.type,
                              color: value,
                              availableColors: product.availableColors,
                              weight: product.weight,
                              price: product.price,
                            );
                          });
                        },
                      ),
                    SizedBox(height: 8), // Add vertical space
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            child: TextField(
                              controller: weightController,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Weight',
                              ),
                              onChanged: (value) {
                                // Update the weight when the text changes
                                product.weight = int.tryParse(value) ?? 0;
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 30), // Add horizontal space
                        ElevatedButton(
                          onPressed: () {
                            cart.addToCart(product);
                            print(cart.items.length);
                            print('Added to Cart: ${product.name}');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text('Add to Cart'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

