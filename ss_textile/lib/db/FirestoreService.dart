import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ss_textile/DataClass/Product.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'products'; // Name of the Firestore collection

  // Method to fetch product types and total weights from Firestore
  Future<List<MapEntry<ProductType, double>>> getProductTypesWithTotalWeights() async {
    try {
      // Map to store total weights for each product type
      Map<ProductType, double> totalWeights = {};

      // Iterate over each product type
      for (ProductType productType in ProductType.values) {
        // Construct the path to the subcollection for the current product type
        String subcollectionPath = productType.toString();

        // Query the subcollection
        QuerySnapshot querySnapshot = await _db.collection(_collectionName).doc(subcollectionPath).collection('products').get();

        // Calculate total weight for the current product type
        double totalWeight = querySnapshot.docs.fold<double>(0, (previousValue, doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          int weight = data['weight'] ?? 0;
          return previousValue + weight;
        });

        // Store the total weight for the current product type
        totalWeights[productType] = totalWeight;
      }

      // Convert the map to a list of map entries
      List<MapEntry<ProductType, double>> productTypesWithTotalWeights = totalWeights.entries.toList();

      return productTypesWithTotalWeights;
    } catch (e) {
      print('Error fetching product types with total weights: $e');
      return [];
    }
  }
   // Method to fetch products data from Firestore
  Future<List<ProductTypeData>> getProductsData() async {
    try {
      List<ProductTypeData> productsData = [];

      // Iterate over each product type
      for (ProductType productType in ProductType.values) {
        // Construct the path to the subcollection for the current product type
        String subcollectionPath = productType.toString();

        // Query the subcollection
        QuerySnapshot querySnapshot = await _db.collection(_collectionName).doc(subcollectionPath).collection('products').get();

        // Extract product data from documents in the subcollection
        List<Product> products = querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          String name = data['name'] ?? 'Unknown';
          ColorType? color = _convertStringToColorType(data['color']);
          List<ColorType>? availableColors = _convertDynamicListToColorTypeList(data['availableColors']);
          int weight = data['weight'] ?? 0;
          double price = (data['price'] as num?)?.toDouble() ?? 0;

          return Product(
            name: name,
            type: productType,
            color: color,
            availableColors: availableColors,
            weight: weight,
            price: price,
          );
        }).toList();

        // Create ProductTypeData object and add to the list
        productsData.add(ProductTypeData(
          type: productType,
          products: products,
        ));
      }

      return productsData;
    } catch (e) {
      print('Error fetching products data: $e');
      return [];
    }
  }

  // Helper method to convert dynamic list to List<ColorType> or null
  List<ColorType>? _convertDynamicListToColorTypeList(dynamic dynamicList) {
    if (dynamicList == null) return null;
    List<ColorType> colorTypes = [];
    for (var item in dynamicList) {
      if (item is String) {
        ColorType? colorType = _convertStringToColorType(item);
        if (colorType != null) {
          colorTypes.add(colorType);
        }
      }
    }
    return colorTypes.isNotEmpty ? colorTypes : null;
  }

  // Helper method to convert string to ColorType enum
  ColorType? _convertStringToColorType(String? color) {
    if (color == null) return null;
    switch (color) {
      case 'white':
        return ColorType.white;
      case 'gray':
        return ColorType.gray;
      case 'pakistanGreen':
        return ColorType.pakistanGreen;
      case 'dark':
        return ColorType.dark;
      case 'light':
        return ColorType.light;
      default:
        return null; // Return null if color is not found
    }
  }
  Future<List<Product>> getProductsForProductType(ProductType productType) async {
    try {
      List<Product> products = [];

      // Construct the path to the subcollection for the given product type
      String subcollectionPath = productType.toString();

      // Query the subcollection
      QuerySnapshot querySnapshot = await _db.collection(_collectionName).doc(subcollectionPath).collection('products').get();

      // Extract product data from documents in the subcollection
      products = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String name = data['name'] ?? 'Unknown';
        ColorType? color = _convertStringToColorType(data['color']);
        List<ColorType>? availableColors = _convertDynamicListToColorTypeList(data['availableColors']);
        int weight = data['weight'] ?? 0;
        double price = (data['price'] as num?)?.toDouble() ?? 0;

        return Product(
          name: name,
          type: productType,
          color: color,
          availableColors: availableColors,
          weight: weight,
          price: price,
        );
      }).toList();

      return products;
    } catch (e) {
      print('Error fetching products for product type $productType: $e');
      return [];
    }
  }
}
