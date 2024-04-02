import 'package:flutter/material.dart';
import 'package:ss_textile/commonWidget/Appbar.dart';
import 'package:ss_textile/pages/CustomCard.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);
//248 247 244
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Cart",leadingColor: Colors.black,),
      backgroundColor: Color.fromARGB(255, 244, 239, 225),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomCard(),
          const SizedBox(height: 16), // Add some space between cards
          CustomCard(),
          const SizedBox(height: 16), // Add some space between cards
          CustomCard(),
        ],
      ),
    );
  }
}
