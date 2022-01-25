import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adamlabs_test2/constants.dart';
import 'package:flutter_adamlabs_test2/screen/order/components/app_bar.dart';
import 'package:flutter_adamlabs_test2/screen/review/revieworder.dart';
import 'package:flutter_adamlabs_test2/screen/success/components/defaultButton.dart';

class NewOrder extends StatefulWidget {
  @override
  NewOrderState createState() {
    return NewOrderState();
  }
}

class NewOrderState extends State<NewOrder> {
  String _makanan = "";
  String _minuman = "";
  String _alamat = "";
  final _controllerdate = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: orderAppBar(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Mau pesan apa?',
              style: TextStyle(
                color: kTextLightColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ksecondaryColor.withOpacity(0.32))),
                    child: Padding(
                        padding: EdgeInsets.all(2),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Makanan",
                              hintStyle: TextStyle(color: ksecondaryColor)),
                          onChanged: (value) {
                            _makanan = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'makanan tidak boleh kosong';
                            }
                            return null;
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ksecondaryColor.withOpacity(0.32))),
                    child: Padding(
                        padding: EdgeInsets.all(2),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Minuman",
                            hintStyle: TextStyle(color: ksecondaryColor),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _minuman = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'minuman tidak boleh kosong';
                            }
                            return null;
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ksecondaryColor.withOpacity(0.32))),
                    child: Padding(
                        padding: EdgeInsets.all(2),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Alamat",
                            hintStyle: TextStyle(color: ksecondaryColor),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            _alamat = value;
                          },
                          validator: (value) {
                            if (value!.length < 10) {
                              return 'alamat minimal 10 karakter';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          minLines: 3,
                          maxLines: 12,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ksecondaryColor.withOpacity(0.32))),
                    child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Tanggal Order",
                                hintStyle: TextStyle(color: ksecondaryColor),
                                border: InputBorder.none,
                              ),
                              controller: _controllerdate,
                            )),
                            ElevatedButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025),
                                    builder: (context, child) => Theme(
                                        data: ThemeData().copyWith(
                                            colorScheme: ColorScheme.dark(
                                                primary: kPrimaryColor,
                                                onPrimary: kTextColor,
                                                surface: kPrimaryColor,
                                                onSurface: kTextColor)),
                                        child: child!),
                                  ).then((value) {
                                    setState(() {
                                      _controllerdate.text =
                                          value.toString().substring(0, 10);
                                    });
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Icon(
                                  Icons.calendar_today_sharp,
                                  color: Colors.white,
                                  size: 24.0,
                                ))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: DefaultButton(
                      btnText: "Review Order",
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Harap Isian diperbaiki')));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewOrder(
                                      _makanan,
                                      _minuman,
                                      _alamat,
                                      _controllerdate.text)));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
