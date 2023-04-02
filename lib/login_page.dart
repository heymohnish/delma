// TODO Implement this library.
import 'package:delma/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'components/home_page/home_page.dart';
import 'models/user.dart';

class SecondPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKeyq = GlobalKey<FormState>();
  late String _inputText;
  static String email = "";
  static String pass = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 60, right: 55, top: 140),
              child: Lottie.network(
                "https://assets8.lottiefiles.com/packages/lf20_vtxqbxsl.json",
                width: 300, // Set the width of the animation to 200 pixels.
                height: 200, // Set the height of the animation to 200 pixels.),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(left: 60, right: 60, top: 290),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "mail",
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          email = value.toString();
                          return 'Please enter some text';
                        } else {
                          // final bool emailValid = RegExp(
                          //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          //     .hasMatch(value);
                          email = value.toString();
                          // if (!emailValid) {
                          //   return 'invalid mail id';
                          // }
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputText = value!;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(left: 60, right: 60, top: 380),
              child: Form(
                key: _formKeyq,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                        border: myinputborder(),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          pass = value;
                          return 'Please enter some text';
                        } else {
                          pass = value;
                        }
                      },
                      onSaved: (value) {
                        _inputText = value!;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 65, right: 0, top: 470),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _formKeyq.currentState!.validate()) {
                    _formKey.currentState?.save();
                    _formKeyq.currentState?.save();
                    // String ff = _formKey.currentState!.toString();
                    // _formKey.currentState!.toString()
                    // final dio = Dio();
                    // dio();
                    _getData(email, pass).then((value) => {
                          if (value == null)
                            {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           HomePage(name: "name")),
                              // )
                            }
                          else
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(value1: value)),
                              )
                            }
                        });
                    // if (ff == true) {}
                    // print(ff);
                    // print(ff);
                    // Do something with the user input, such as save it to a database or display it on a new screen
                  }
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
            Container(
              // alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 65, right: 0, top: 530),
              child: GestureDetector(
                onTap: () {
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState?.save();
                  //   _formKeyq.currentState?.save();
                  //   // Do something with the user input, such as save it to a database or display it on a new screen
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyForm()),
                  );
                },
                child: Text('Don"t have an account ?'),
                // child: Text(
                //   'Sign In',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // ),
                // style: ElevatedButton.styleFrom(
                //   primary: Colors.blueGrey,
                //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(4.0),
                //   ),
                // ),
              ),
            ),

            Positioned(
              bottom: 760,
              right: 330,
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Transform.rotate(
                    angle: 2 *
                        (3.14) *
                        500, // Rotate the animation by 0.5 radians (about 28 degrees)
                    child: Lottie.network(
                      "https://assets10.lottiefiles.com/packages/lf20_ZUd5j6.json",
                      width:
                          80, // Set the width of the animation to 200 pixels.
                      height:
                          80, // Set the height of the animation to 200 pixels.),
                    ),
                  )),
            ),

            // Positioned(
            //   bottom: -50,
            //   right: -24,
            //   child: Lottie.network(
            //     "https://assets7.lottiefiles.com/packages/lf20_nrupnhyt.json",
            //     width: 500, // Set the width of the animation to 200 pixels.
            //     height: 455, // Set the height of the animation to 200 pixels.),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
// void fetchData() async {
//   try {
//     final response = await dio
//         .get('http://127.0.0.1:1234/user/exist?mail=mohnish@gmail.com');
//     if (response.statusCode == 200) {
//       // Handle the response data here
//       print(response.data);
//     } else {
//       // Handle errors
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   } catch (e) {
//     // Handle any exceptions that occur
//     print('Request failed with error: $e.');
//   }
// }

Future<User?> _getData(String email, String pass) async {
  final dio = Dio();
  // final response = await http.get(Uri.parse(
  //     'http://192.168.0.143:1234/user/exist?mail=mohnsh@gmail.com&code=mohnish'));
  final response = await dio.get(
      'http://192.168.29.175:1234/user/exist?mail=' + email + '&code=' + pass);
  if (response.statusCode! >= 200 && response.statusCode! <= 300) {
    if (response.data["data"] != null &&
        response.data["data"]["exist"] != null &&
        response.data["data"]["exist"] == true) {
      User kk = User.fromJson(response.data["data"]);
      print(response.data["data"].toString());
      return User.fromJson(response.data["data"]);
    } else if (response.data["data"] != null &&
        response.data["data"]["exist"] != null &&
        response.data["data"]["exist"] == false) {
      Fluttertoast.showToast(msg: "Invalid mail or password");
      return null;
    } else {
      Fluttertoast.showToast(msg: "Invalid mail or password");
      return null;
    }
    // Handle the response here
  } else {
    Fluttertoast.showToast(msg: "server dead");
    return null;
  }

//   }catch{
// return false;
//   }
}
