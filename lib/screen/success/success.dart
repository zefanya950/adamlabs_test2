import 'package:flutter/material.dart';
import 'package:flutter_adamlabs_test2/constants.dart';
import 'package:flutter_adamlabs_test2/screen/home/homescreen.dart';
import 'package:flutter_adamlabs_test2/screen/success/components/defaultButton.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/success.gif'),
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: kLessPadding),
            child: Text(
              'Sukses',
              style: kDarkTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Makananmu berhasil di pesan',
              textAlign: TextAlign.center,
              style: kSubTextStyle,
            ),
          ),
          DefaultButton(
              btnText: "OK",
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen())))
        ],
      ),
    );
  }
}
