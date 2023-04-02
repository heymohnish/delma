import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:lottie/lottie.dart';
import 'package:quickalert/quickalert.dart';
import 'models/user.dart';

class SignInSlate extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignInSlate> {
  final _formKeya = GlobalKey<FormState>();
  late String _inputText;
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    password.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Add your widgets here
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 1,
      ));
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.greenAccent,
        width: 1,
      ));
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  late double heightDouble = 0.0;
  late double weightDouble = 0.0;
  final List<String> _items = ['female', 'male'];
  final List<String> level = [
    'Level-1 (Sedentary)',
    'Level-2 (Lightly active)',
    'Level-3 (Moderately active)',
    'Level-4 (Very active)',
    'Level-5 (Extra active)',
  ];
  late String ipAddress;
  late String _selectedItem;
  // static String email = "";
  // static String pass = "";
  User user = User();

  // late String rs_name;
  // late String rs_mail;
  // late String rs_password;
  // late String rs_rePassword;
  // late String rs_gender;
  // late Double rs_dob;
  // late String rs_dob_str;
  // late Double rs_height;
  // late Double rs_weight;
  // late Int rs_level;

  // late DateTime _selectedDate;
  void initState() {
    dateinput.text = "";
    mail.text = "";
    name.text = "";
    password.text = "";
    rePassword.text = "";
    location.text = "";
    height.text = "";
    weight.text = "";
    // height.dispose();
    // weight.dispose();
    //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 350,
                    width: 700,
                    child: Lottie.network(
                      "https://assets7.lottiefiles.com/packages/lf20_nrupnhyt.json",
                      fit: BoxFit
                          .fitWidth, // Set the height of the animation to 200 pixels.),
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Container(
                    child: Text(
                      "Welcome to Delma!\n",
                      style: TextStyle(
                        fontSize: 25, // Change the font size
                        fontWeight: FontWeight.bold, // Change the font family
                        color: Colors.black, // Change the font color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //mail
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.people_outline,
                        color: Colors.black,
                      ),
                      labelText: "name *",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    validator: (value) {
                      user.name = value;
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                    },
                    onSaved: (value) {
                      name.text = value!;
                    },
                  ),

                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: mail,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outlined,
                        color: Colors.black,
                      ),
                      labelText: "mail *",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    validator: (value) {
                      user.mail = value;
                      if (value!.isEmpty) {
                        return 'mail id is madatory';
                      } else {
                        // final bool emailValid = RegExp(
                        //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //     .hasMatch(value);
                        // if (!emailValid) {
                        //   return 'invalid mail id';
                        // }
                      }
                      return null;
                    },
                    onSaved: (value) {
                      mail.text = value!;
                    },
                  ),
                  SizedBox(height: 20.0),

                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_open_outlined,
                        color: Colors.black,
                      ),
                      labelText: "password *",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    validator: (value) {
                      user.password = value;
                      if (value!.isEmpty) {
                        return 'password is madatory';
                      } else {
                        // final bool passValid = RegExp(
                        //   r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
                        // ).hasMatch(value);
                        // if (!passValid) {
                        //   return '*At least 8 characters long\n*Must contain at least one uppercase letter\n*Must contain at least one lowercase letter\n*Must contain at least one digit';
                        // }
                      }
                    },
                    onSaved: (value) {
                      name.text = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: rePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      labelText: "Re-password *",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    validator: (value) {
                      user.rePassword = value;
                      if (value!.isEmpty) {
                        return 'Please enter password again';
                      }
                      // if (value != password.text) {
                      //   return 'Please re-check your password';
                      // }
                    },
                    onSaved: (value) {
                      name.text = value!;
                    },
                  ),

                  SizedBox(height: 20.0),
                  DropdownButtonFormField(
                    items: _items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      user.gender = newValue;
                      // Do something with the selected value
                    },
                    validator: (item) {
                      if (item == null) {
                        return 'gender is madatory';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.child_care,
                        color: Colors.black,
                      ),
                      labelText: "gender*",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                  ),

                  // SizedBox(height: 20.0),
                  // TextFormField(
                  //   controller: dateinput,

                  //   decoration: InputDecoration(
                  //     prefixIcon: Icon(
                  //       Icons.calendar_month_outlined,
                  //       color: Colors.black,
                  //     ),
                  //     labelText: "DOB *",
                  //     border: myinputborder(),
                  //     enabledBorder: myinputborder(),
                  //     focusedBorder: myfocusborder(),
                  //   ),
                  //   readOnly:
                  //       true, //set it true, so that user will not able to edit text
                  //   onTap: () async {
                  //     DateTime? pickedDate = await showDatePicker(
                  //         context: context,
                  //         initialDate: DateTime.now(),
                  //         firstDate: DateTime(
                  //             1980), //DateTime.now() - not to allow to choose before today.
                  //         lastDate: DateTime(2101));

                  //     if (pickedDate != null) {
                  //       print(
                  //           pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  //       String formattedDate =
                  //           DateFormat('dd-MM-yyyy').format(pickedDate);
                  //       // user.dob = 21.00 as Double;
                  //       print(
                  //           formattedDate); //formatted date output using intl package =>  2021-03-16
                  //       //you can implement different kind of Date Format here according to your requirement

                  //       setState(() {
                  //         dateinput.text =
                  //             formattedDate; //set output date to TextField value.
                  //       });
                  //     } else {
                  //       print("empty");
                  //     }
                  //   },
                  //   validator: (formattedDate) {
                  //     if (formattedDate!.isEmpty) {
                  //       return 'dob is mandatory';
                  //     }
                  //     return null;
                  //   },
                  // ),

                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: dateinput,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                      ),
                      labelText: "DOB*",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    validator: (value) {
                      user.dob = double.tryParse(value!);
                      if (double.tryParse(value!) == null) {
                        return 'Please enter a valid decimal value';
                      }
                      if (double.parse(value) < 18.0 ||
                          double.parse(value) == 18.0) {
                        return 'value should be > 18';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name.text = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.height,
                        color: Colors.black,
                      ),
                      labelText: "height (cm)*",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    validator: (value) {
                      user.height = double.tryParse(value!);
                      if (double.tryParse(value!) == null) {
                        return 'Please enter a valid decimal value';
                      }
                      if (double.parse(value) < 0.0 ||
                          double.parse(value) == 1.0) {
                        return 'value should be > 1';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name.text = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.monitor_weight_outlined,
                        color: Colors.black,
                      ),
                      labelText: "weight (cm)*",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    validator: (value) {
                      user.weight = double.tryParse(value!);
                      if (double.tryParse(value!) == null) {
                        return 'Please enter a valid decimal value';
                      }
                      if (double.parse(value) < 0.0 ||
                          double.parse(value) == 1.0) {
                        return 'value should be > 1';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // Double uu = double.tryParse(value);

                      name.text = value!;
                    },
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField(
                    items: level.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // 'Level-1 (Sedentary)',
                      // 'Level-2 (Lightly active)',
                      // 'Level-3 (Moderately active)',
                      // 'Level-4 (Very active)',
                      // 'Level-5 (Extra active)',
                      user.level = newValue;
                      // Do something with the selected value
                    },
                    validator: (item) {
                      if (item == null) {
                        return 'Activity Level is madatory';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.fitness_center_rounded,
                        color: Colors.black,
                      ),
                      labelText: "Activity Level*",
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // return "";
                        _createData(user).then((value) async => {
                              if (value != null)
                                {
                                  print("fdsa"),
                                  await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.loading,
                                    title: 'Loading',
                                    text: 'Fetching your data',
                                  ),
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000)),
                                  await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: 'Account Created Successfully!',
                                  )
                                }
                              else
                                {}
                            });
                      }
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 45.0),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

Future<String?> _createData(User user) async {
  final dio = Dio();
  // var ipresponse =
  //     await dio.get('https://api.jsonbin.io/v3/b/642869bdc0e7653a059bb7a9',
  //         options: Options(
  //           headers: {
  //             "X-Master-Key":
  //                 "\$2b\$10\$355xlWN8Po4wKmRcFsMUNev9n0bOhYGr8genkiJZ/Jmz9AZTqaKUy",
  //             'X-Access-Key':
  //                 '\$2b\$10\$P1oZAlmba6/xQ6SaiODP5unhX3kHk/dDC5ELFrJStOix6fILuBc.q'
  //           },
  //         ));
  // print(ipresponse.data['record']['data'].toString());
  // // return null;
  // // ipAddress = ipresponse.data['record']['data']['record'].toString();
  // String ip = ipresponse.data['record']['data'].toString();
  final response = await dio.post(
      'http://' + '192.168.29.175' + ':1234/user/upsert',
      data: json.encode(user.toJson()));
  if (response.statusCode! >= 200 && response.statusCode! <= 300) {
    if (response.data["data"] != null) {
      // User kk = User.fromJson(response.data["data"]);
      print(response.data["data"].toString());
      return response.data["data"].toString();
    } else {
      Fluttertoast.showToast(msg: "Mail Already exist");
      return null;
    }
  } else {
    Fluttertoast.showToast(msg: "server dead");
    return null;
  }
}
