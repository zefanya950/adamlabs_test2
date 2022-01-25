import 'package:flutter/material.dart';
import 'package:flutter_adamlabs_test2/screen/order/neworder.dart';
import 'package:flutter_adamlabs_test2/constants.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 16.0,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Zefa"),
                accountEmail: Text("zefa@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/300?img=5"))),
            ListTile(
              title: Text("New Order"),
              textColor: kTextColor,
              leading: Icon(
                Icons.book,
                color: kPrimaryColor,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewOrder();
                    },
                  ),
                );
              },
            ),
          ],
        )));
  }
}
