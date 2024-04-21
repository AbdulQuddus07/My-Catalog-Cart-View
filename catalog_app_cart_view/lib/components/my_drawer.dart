import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Meezan Bank",style: TextStyle(color: Colors.black,fontSize: 20),),
                accountEmail: Text("meezanbank@gmail.com",style: TextStyle(color: Colors.black),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/image_profile.avif"),
                ),
              )),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              textScaler: TextScaler.linear(1.2),
              style: TextStyle(color: Colors.white),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.person,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              textScaler: TextScaler.linear(1.2),
              style: TextStyle(color: Colors.white),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "Email",
              textScaler: TextScaler.linear(1.2),
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: InkWell(
              onTap: () {
                PersistentShoppingCart().clearCart();
              },
              child: const Text(
                "Logout",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
