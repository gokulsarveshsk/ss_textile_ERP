import 'package:flutter/material.dart';
import 'package:ss_textile/commonWidget/Appbar.dart';
import 'package:ss_textile/commonWidget/bottomBar.dart';
import 'package:ss_textile/pages/InventoryPage.dart';
import 'package:ss_textile/pages/LineChart.dart';
import 'package:ss_textile/pages/MyCartPage.dart';
import 'package:ss_textile/pages/ProductType.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
           useMaterial3: false,
           primarySwatch: Colors.blue, 
            scaffoldBackgroundColor: Colors.white, 
            buttonTheme: const ButtonThemeData(
            buttonColor: Colors.blue, 
            textTheme: ButtonTextTheme.primary, 
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.white70, 
          ),
        ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        leadingColor: Colors.white,
        trailing: IconButton(  
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCartPage()),
            );
          },
          icon: Icon(Icons.shopping_cart),
          color: Colors.black,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          LineChartSample1(),
          const SizedBox(height: 16), 
        ],
      ),
      bottomNavigationBar:  MyBottomNavigationBar(),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black, 
            foregroundColor: Colors.white, 
            elevation: 4, 
          ),
        ),
        child: FloatingActionButton(
          
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductsPage()),
            );
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
