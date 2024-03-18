import 'package:flutter/material.dart';

class DrawerManu extends StatelessWidget {
  const DrawerManu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green.shade100, Colors.blue.shade100])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue.shade200,
                    foregroundImage: const NetworkImage(
                        "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-person-icon.png"),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Pawan Patidar",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0, left: 4),
                      child: Text(
                        "90099090900",
                        style: TextStyle(color: Colors.black26, fontSize: 14),
                      ),
                    )
                  ],
                ),
              ],
            )),
        ListTile(
          leading: Icon(Icons.home_outlined),
          title: Text("Home"),
          selected: true,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart_outlined),
          title: Text("Orders"),
          selected: false,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text("Wishlist"),
          selected: false,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
