import 'package:flutter/material.dart';
import 'package:flutter_adamlabs_test2/constants.dart';
import 'package:flutter_adamlabs_test2/screen/review/components/app_bar.dart';
import 'package:flutter_adamlabs_test2/screen/success/success.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewOrder extends StatefulWidget {
  final String _makanan;
  final String _minuman;
  final String _alamat;
  final String _date;
  ReviewOrder(this._makanan, this._minuman, this._alamat, this._date);
  @override
  State<StatefulWidget> createState() {
    return ReviewOrderState();
  }
}

class ReviewOrderState extends State<ReviewOrder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: reviewAppBar(context),
        backgroundColor: kPrimaryColor,
        body: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                "assets/images/burger.png",
                width: double.infinity,
                height: size.height * 0.25,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ksecondaryColor,
                        ),
                        SizedBox(width: 10),
                        Text(widget._alamat),
                        Spacer(),
                        Text(widget._date)
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    "Order summary",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    widget._makanan,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Spacer(),
                                  Text(
                                    "1x",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    widget._minuman,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Spacer(),
                                  Text(
                                    "1x",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.1),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: size.width * 0.8,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Success())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset("assets/icons/bag.svg"),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Konfirmasi Order",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ]));
  }
}
