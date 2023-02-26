import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login_page.dart'; // Import the second_page.dart file

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'My App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // flex: 3,
            Positioned(
              bottom: 410,
              right: 60,
              child: Lottie.network(
                "https://assets3.lottiefiles.com/packages/lf20_lmzcvfyy.json",
                width: 300, // Set the width of the animation to 200 pixels.
                height: 455, // Set the height of the animation to 200 pixels.),
              ),
            ),
            Positioned(
              bottom: 370,
              right: 102,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                  // Handle button press here.
                },
                child: Text(
                  'Lets Start!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 20,
              child: Lottie.network(
                "https://assets2.lottiefiles.com/packages/lf20_8uurzxlh.json",
                width: 400, // Set the width of the animation to 200 pixels.
                height: 320, // Set the height of the animation to 200 pixels.),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
