import 'package:flutter/material.dart';
import 'package:flutter_adamlabs_test2/screen/newOrder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Order',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Online Order Home Page'),
      routes: {
        'neworder': (context) => NewOrder(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget myDrawer() {
    return Drawer(
        elevation: 16.0,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('active_user'),
                accountEmail: Text("xyz@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/300?img=5"))),
            ListTile(
              title: Text("New Order"),
              leading: Icon(
                Icons.movie,
                color: Colors.orangeAccent,
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, 'neworder');
              },
            ),
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      drawer: myDrawer(),
    );
  }
}
