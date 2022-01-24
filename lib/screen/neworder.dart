import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('New Order'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Makanan',
                    ),
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
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Minuman',
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
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Alamat',
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
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Tanggal Order',
                        ),
                        controller: _controllerdate,
                      )),
                      ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025))
                                .then((value) {
                              setState(() {
                                _controllerdate.text =
                                    value.toString().substring(0, 10);
                              });
                            });
                          },
                          child: Icon(
                            Icons.calendar_today_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ))
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Harap Isian diperbaiki')));
                    } else {}
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
