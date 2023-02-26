// TODO Implement this library.
import 'package:delma/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKeyq = GlobalKey<FormState>();
  late String _inputText;

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
                          return 'Please enter some text';
                        } else {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'invalid mail id';
                          }
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
                          return 'Please enter some text';
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

class MyInputPage extends StatefulWidget {
  @override
  _MyInputPageState createState() => _MyInputPageState();
}

class _MyInputPageState extends State<MyInputPage> {
  final _formKey = GlobalKey<FormState>();
  late String _inputText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Input Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your text here',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                _inputText = value!;
              },
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  // Do something with the user input, such as save it to a database or display it on a new screen
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
