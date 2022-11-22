import 'package:appfood/pages/home/home_page.dart';
import 'package:appfood/pages/login/login_page.dart';
import 'package:appfood/pages/profile/profile_page.dart';
import 'package:appfood/route/routing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            accountName: Text(userModel.fullName),
            accountEmail: Text(userModel.emailAddress),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/non1.jpg"),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                RoutingPage.goTonext(
                    context: context, navigateTo: ProfilePage());
              },
              icon: Icon(
                Icons.person,
              ),
            ),
            title: Text("Profile"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            title: Text("Cart"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
              ),
            ),
            title: Text("Favorite"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_basket_sharp,
              ),
            ),
            title: Text("My Order"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    ),
                  );
            },
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: Text("Log out"),
          )
        ],
      ),
    );
  }
}
