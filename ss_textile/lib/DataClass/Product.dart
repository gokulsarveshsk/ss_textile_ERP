enum ProductType { thirtySemiCombed, twentyFiveSemiCombed, polyester }

enum ColorType { white, gray, pakistanGreen, dark, light, mixed }

class Product {
   String name;
  final ProductType type;
  final ColorType? color;
  final List<ColorType>? availableColors; // Add availableColors property
   int weight;
   double price;

  Product({
    required this.name,
    required this.type,
    this.color,
    this.availableColors,
    required this.weight,
    required this.price,
  });
}

class ProductTypeData {
  final ProductType type;
  final List<Product> products;

  ProductTypeData({required this.type, required this.products});
}

List<ProductTypeData> productsData = [
  ProductTypeData(
    type: ProductType.thirtySemiCombed,
    products: [
      Product(name: '19 Mixed', type: ProductType.thirtySemiCombed, weight: 150, price: 100, availableColors: [
        ColorType.white,
        ColorType.gray,
        ColorType.pakistanGreen,
        ColorType.dark,
        ColorType.light,
      ]),
      Product(name: 'White', type: ProductType.thirtySemiCombed, color: ColorType.white, weight: 200, price: 100),
      Product(name: 'Gray', type: ProductType.thirtySemiCombed, color: ColorType.gray, weight: 150, price: 100),
      Product(name: 'Pakistan Green', type: ProductType.thirtySemiCombed, color: ColorType.pakistanGreen, weight: 100, price: 100),
      Product(name: 'Dark Colours', type: ProductType.thirtySemiCombed, color: ColorType.dark, weight: 300, price: 100,availableColors: [
        ColorType.white,
        ColorType.gray,
        ColorType.pakistanGreen,
        ColorType.dark,
        ColorType.light]),
      Product(name: 'Light Colours', type: ProductType.thirtySemiCombed, color: ColorType.light, weight: 100, price: 100,availableColors: [
        ColorType.white,
        ColorType.gray,
        ColorType.pakistanGreen,
        ColorType.dark,
        ColorType.light,]),
    ],
  ),
  ProductTypeData(
    type: ProductType.twentyFiveSemiCombed,
    products: [
      Product(name: '19 Mixed Colours', type: ProductType.twentyFiveSemiCombed, weight: 200, price: 200, availableColors: [
        ColorType.pakistanGreen,
        ColorType.gray,
      ]),
      Product(name: 'Pakistan Green', type: ProductType.twentyFiveSemiCombed, color: ColorType.pakistanGreen, weight: 500, price: 200),
      Product(name: 'Gray', type: ProductType.twentyFiveSemiCombed, color: ColorType.gray, weight: 600, price: 200),
    ],
  ),
  ProductTypeData(
    type: ProductType.polyester,
    products: [
      Product(name: 'Product 1', type: ProductType.polyester, weight: 100, price: 100),
      Product(name: 'Product 2', type: ProductType.polyester, weight: 700, price: 100),
    ],
  ),
];

class Cart {
  List<Product> _items = [];

  void addToCart(Product product) {
    _items.add(product);
    print(_items.length); // Print the items to verify
  }

  List<Product> get items => List.unmodifiable(_items);
}
