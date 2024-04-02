import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Apply the theme to the Card widget
      data: Theme.of(context).copyWith(
        cardTheme: CardTheme(
          color: Colors.white, 
          // elevation: 4, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            Text(
                              "30's Semi - Combed",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "234 KG",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[500],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "\$299",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 7,
              right: 8,
              child: IconButton(
                icon: Icon(Icons.edit),
                color: Colors.grey[500],
                iconSize: 20,
                onPressed: () {
                  _showEditDialog(context);
                },
              ),
            ),
            Positioned(
              bottom: 7,
              right: 8,
              child: IconButton(
                icon: Icon(Icons.delete_outline_outlined),
                color: Colors.grey[500],
                iconSize: 20,
                onPressed: () {
                  // Add delete functionality here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        // Apply the theme to the AlertDialog widget
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white, // Set background color to white
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black, // Set button text color
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black, // Set button background color
            ),
          ),
        ),
        child: AlertDialog(
          title: Text('Update Quantity'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter new quantity'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
              ),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality to update quantity here
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
              ),
              child: Text('Update'),
            ),
          ],
        ),
      );
    },
  );
}
}