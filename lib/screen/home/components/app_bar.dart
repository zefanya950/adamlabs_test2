import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_adamlabs_test2/constants.dart';

AppBar homeAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () => scaffoldKey.currentState!.openDrawer(),
    ),
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Online",
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
