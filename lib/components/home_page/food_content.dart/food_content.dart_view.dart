import 'dart:convert';
import 'dart:ui';

import 'package:delma/components/home_page/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../models/food.dart';
import '../../../models/user.dart';
import 'food_content.dart.dart';

class FoodContentView extends State<FoodContent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  static double search = 0.00;

  late double search_inputText;
  late double qty;
  // final double barHeight = 50.0;
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              // key
              //: _formKey,

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 55.0),
                    Container(
                      child: Text(
                        'Searched for ' + widget.foodObj.label.toString(),
                        style: TextStyle(
                          fontSize: 22, // Change the font size
                          fontWeight: FontWeight.bold, // Change the font family
                          color: Colors.white,
                          decoration:
                              TextDecoration.none, // Change the font color
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 260,
                      width: 500,
                      child: Lottie.network(
                        "https://assets2.lottiefiles.com/packages/lf20_9ycwmgb9.json",
                        fit: BoxFit
                            .fitWidth, // Set the height of the animation to 200 pixels.),
                      ),
                    ),
                    SizedBox(height: 90.0),
                    Container(
                      child: Text(
                        'Total kcal (100g)',
                        style: TextStyle(
                          fontSize: 20, // Change the font size
                          fontWeight: FontWeight.bold, // Change the font family
                          color: Colors.white70, // Change the font color
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(0.0),
                        height: 80.0, //MediaQuery.of(context).size.width * .08,
                        width: 10.0, //MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            LayoutBuilder(builder: (context, constraints) {
                              print(constraints);
                              return Container(
                                height: constraints.maxHeight,
                                width: constraints.maxHeight,
                                decoration: BoxDecoration(
                                  color: Colors.amber[200],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Icon(
                                  Icons.bolt_sharp,
                                  color: Colors.red,
                                ),
                              );
                            }),
                            Expanded(
                              child: Text(
                                '   ' +
                                    widget.foodObj.nutrients!.ENERC_KCAL!
                                        .toStringAsFixed(2),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 25, // Change the font size
                                  fontWeight:
                                      FontWeight.bold, // Change the font family
                                  color: Colors.white70,
                                  // Change the font color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      child: Text(
                        'Total Protein (100g)',
                        style: TextStyle(
                          fontSize: 20, // Change the font size
                          fontWeight: FontWeight.bold, // Change the font family
                          color: Colors.white70, // Change the font color
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(0.0),
                        height: 80.0, //MediaQuery.of(context).size.width * .08,
                        width: 10.0, //MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            LayoutBuilder(builder: (context, constraints) {
                              print(constraints);
                              return Container(
                                height: constraints.maxHeight,
                                width: constraints.maxHeight,
                                decoration: BoxDecoration(
                                  color: Colors.amber[200],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Icon(
                                  Icons.local_drink,
                                  color: Colors.red,
                                ),
                              );
                            }),
                            Expanded(
                              child: Text(
                                '   ' +
                                    widget.foodObj.nutrients!.PROCNT!
                                        .toStringAsFixed(2),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 25, // Change the font size
                                  fontWeight:
                                      FontWeight.bold, // Change the font family
                                  color: Colors.white70,
                                  // Change the font color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      child: Text(
                        'Total Fat (100g)',
                        style: TextStyle(
                          fontSize: 20, // Change the font size
                          fontWeight: FontWeight.bold, // Change the font family
                          color: Colors.white70, // Change the font color
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(0.0),
                        height: 80.0, //MediaQuery.of(context).size.width * .08,
                        width: 10.0, //MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            LayoutBuilder(builder: (context, constraints) {
                              print(constraints);
                              return Container(
                                height: constraints.maxHeight,
                                width: constraints.maxHeight,
                                decoration: BoxDecoration(
                                  color: Colors.amber[200],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Icon(
                                  Icons.whatshot_outlined,
                                  color: Colors.red,
                                ),
                              );
                            }),
                            Expanded(
                              child: Text(
                                '   ' +
                                    widget.foodObj.nutrients!.FAT!
                                        .toStringAsFixed(2),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 25, // Change the font size
                                  fontWeight:
                                      FontWeight.bold, // Change the font family
                                  color: Colors.white70,
                                  // Change the font color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      child: Text(
                        'Total Carbohydrate (100g)',
                        style: TextStyle(
                          fontSize: 20, // Change the font size
                          fontWeight: FontWeight.bold, // Change the font family
                          color: Colors.white70, // Change the font color
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(0.0),
                        height: 80.0, //MediaQuery.of(context).size.width * .08,
                        width: 10.0, //MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            LayoutBuilder(builder: (context, constraints) {
                              print(constraints);
                              return Container(
                                height: constraints.maxHeight,
                                width: constraints.maxHeight,
                                decoration: BoxDecoration(
                                  color: Colors.amber[200],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Icon(
                                  Icons.auto_awesome_sharp,
                                  color: Colors.red,
                                ),
                              );
                            }),
                            Expanded(
                              child: Text(
                                '   ' +
                                    widget.foodObj.nutrients!.CHOCDF!
                                        .toStringAsFixed(2),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 25, // Change the font size
                                  fontWeight:
                                      FontWeight.bold, // Change the font family
                                  color: Colors.white70,
                                  // Change the font color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Form(
                      // key
                      //: _formKey,
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: dateinput,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // prefixIcon: Icon(
                                //     //  IconData(0xf442, fontFamily: iconFont, fontPackage: iconFontPackage);
                                //     // color: Colors.black,
                                //     ),
                                enabled: true,
                                filled: true,
                                fillColor: Colors.white,
                                labelStyle: MaterialStateTextStyle.resolveWith(
                                    (Set<MaterialState> states) {
                                  final Color color =
                                      states.contains(MaterialState.error)
                                          ? Theme.of(context).colorScheme.error
                                          : Colors.orange;
                                  return TextStyle(
                                      color: color, letterSpacing: 1.3);
                                }),
                                hintText: "Quantity in grams *",
                                helperText: "Quantity in grams *",
                                border: myinputborder(),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder(),
                              ),
                              validator: (value) {
                                // user.dob = double.tryParse(value!);
                                if (double.tryParse(value!) == null) {
                                  return 'Please enter a valid decimal value';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                qty = double.tryParse(value!)!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          // String ff = _formKey.currentState!.toString();
                          // _formKey.currentState!.toString()
                          // final dio = Dio();
                          // dio();
                          _getData(qty, widget.foodObj, widget.userId)
                              .then((value) async => {
                                    if (value != null)
                                      {
                                        await QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.success,
                                          text: 'Hurray! Meal Added!',
                                        ),
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(value1: value)),
                                        )
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           HomePage(name: "name")),
                                        // )
                                      }
                                    // else
                                    // {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             HomePage(value1: value)),
                                    //   )
                                    // }
                                  });
                          // if (ff == true) {}
                          // print(ff);
                          // print(ff);
                          // Do something with the user input, such as save it to a database or display it on a new screen
                        }
                      },
                      child: Text(
                        'Add Meal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[700],
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<User?> _getData(double qty, Food pass, String userId) async {
  final dio = Dio();
  // final response = await http.get(Uri.parse(
  //     'http://192.168.0.143:1234/user/exist?mail=mohnsh@gmail.com&code=mohnish'));
  final response = await dio.post(
      'http://192.168.29.175:1234/food/minipost?userId=' +
          userId +
          '&qty=' +
          qty.toString(),
      data: json.encode(pass.toJson()));
  print(response);
  if (response.statusCode! >= 200 && response.statusCode! <= 300) {
    if (response.data["data"] != null) {
      // User kk = User.fromJson(response.data["data"]);
      print(response.data["data"].toString());
      return User.fromJson(response.data["data"]);
    } else {
      Fluttertoast.showToast(msg: "Mail Already exist");
      return null;
    }
  } else {
    Fluttertoast.showToast(msg: "server dead");
    return null;
  }
}

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ));
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.orange,
        width: 1,
      ));
}
