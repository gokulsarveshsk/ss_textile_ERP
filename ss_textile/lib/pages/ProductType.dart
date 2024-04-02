import 'package:flutter/material.dart';
import 'package:ss_textile/DataClass/Product.dart';
import 'package:ss_textile/commonWidget/Appbar.dart';
import 'package:ss_textile/db/FirestoreService.dart'; // Import your FirestoreService
import 'package:ss_textile/pages/ProductTypePage.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final FirestoreService _firestoreService = FirestoreService();
  List<ProductTypeData> _productsData = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchProductsData(); 
  }

  Future<void> _fetchProductsData() async {
    setState(() {
      _isLoading = true; 
    });

    List<ProductTypeData> productsData = await _firestoreService.getProductsData();
    setState(() {
      _productsData = productsData;
      _isLoading = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<ProductType, String> productTypeNames = {
      ProductType.thirtySemiCombed: "30's SemiCombed",
      ProductType.twentyFiveSemiCombed: "25's SemiCombed",
      ProductType.polyester: "Polyester",
    };

    Map<ProductType, String> productTypeImages = {
      ProductType.thirtySemiCombed: "assets/30's.jpg",
      ProductType.twentyFiveSemiCombed: "assets/25's.jpg",
      ProductType.polyester: "assets/polyster.jpg",
    };

    return Scaffold(
      appBar: CustomAppBar(title: "Products"),
      backgroundColor: Color.fromARGB(255, 245, 242, 234),
      body: _isLoading // Show loader if loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _productsData.length,
              itemBuilder: (context, index) {
                final productTypeData = _productsData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductTypePage(
                          productTypeData: productTypeData,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8), // Add padding to the card
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    productTypeImages[productTypeData.type] ?? "",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              productTypeNames[productTypeData.type] ?? "Unknown",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
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
