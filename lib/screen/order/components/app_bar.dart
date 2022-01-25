import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_adamlabs_test2/constants.dart';

AppBar orderAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/home.svg"),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "New",
            style: TextStyle(color: ksecondaryColor),
          ),
          TextSpan(
            text: "Order",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
  );
}
