import 'dart:convert';

import 'package:delma/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import '../../models/food.dart';
import 'food_list.dart/food_list.dart.dart';
import 'home_page.dart';

class HomePageView extends State<HomePage> {
  // late final int selectedIndex;
  // final myObjects = await fetchMyObjects();
  int current_index = 0;
  final _formKey = GlobalKey<FormState>();
  static String search = "";
  late String search_inputText;
  final PageController _pageController = PageController(initialPage: 0);
  int _pageIndex = 0;
  // final List<Widget> pages = [Aboufdt()];
  late final int? selectedIndex;
  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
        body: PageView(
          children: _buildThreePageViewChildren(widget.value1),
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(
              () {
                _pageIndex = index;
              },
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: _buildThreeItems(),
            onTap: (int index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                // backgroundColor: Colors.black)
              );
            },
            currentIndex: _pageIndex,
            fixedColor: Theme.of(context).shadowColor,
            iconSize: 25,
            elevation: 1));
  }

  List<Widget> _buildThreePageViewChildren(User? value1) {
    return <Widget>[
      Scaffold(
        backgroundColor: Colors.black,
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
                      SizedBox(height: 65.0),
                      Container(
                        child: Text(
                          'Hey ' + value1!.name.toString() + ' ,',
                          style: TextStyle(
                            fontSize: 35, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        height: 260,
                        width: 500,
                        child: Lottie.network(
                          "https://assets1.lottiefiles.com/packages/lf20_n1oyepxw.json",
                          fit: BoxFit
                              .fitWidth, // Set the height of the animation to 200 pixels.),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Text(
                          ' BMI (Body Mass Index)',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' + value1.bmi!.toStringAsFixed(2),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' BMR (Basal Metabolic rate)',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' +
                                      value1.bmr!.toStringAsFixed(2) +
                                      " kcal/day",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' Height',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' +
                                      value1.height!.toStringAsFixed(2) +
                                      " cm",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' Weight',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' +
                                      value1.weight!.toStringAsFixed(2) +
                                      " kg",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' Activity Level',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' + value1.level!.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' Active BMR',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' +
                                      value1.activeBMR!.toStringAsFixed(2) +
                                      " kcal/day",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' Current kacl',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' +
                                      value1.total_ENERC_KCAL!
                                          .toStringAsFixed(2) +
                                      " kcal",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' Current FAT',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' +
                                      value1.total_FAT!.toStringAsFixed(2) +
                                      "g",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' Current Protien',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' +
                                      value1.total_PROCNT!.toStringAsFixed(2) +
                                      "g",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        child: Text(
                          ' Current Carbohydrate',
                          style: TextStyle(
                            fontSize: 20, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          height:
                              80.0, //MediaQuery.of(context).size.width * .08,
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
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Icon(
                                    Icons.margin_outlined,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '     ' +
                                      value1.total_CHOCDF!.toStringAsFixed(2) +
                                      "",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 25, // Change the font size
                                    fontWeight: FontWeight
                                        .bold, // Change the font family
                                    color: Colors.white,
                                    // Change the font color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Form(
                  // key
                  //: _formKey,
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 65.0),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            labelText: "Search",
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              search = value.toString();
                              return 'Please enter some text';
                            } else {
                              search = value.toString();
                            }
                            return null;
                          },
                          onSaved: (value) {
                            search_inputText = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, right: 10, top: 150),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // String ff = _formKey.currentState!.toString();
                        // _formKey.currentState!.toString()
                        // final dio = Dio();
                        // dio();
                        print(search);
                        _getData(search).then((value) => {
                              if (value != null)
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodList(
                                            foodList: value,
                                            userId: value1!.id.toString(),
                                            serchText: search)),
                                  )
                                }
                              else
                                {}
                            });
                        // if (ff == true) {}
                        // print(ff);
                        // print(ff);
                        // Do something with the user input, such as save it to a database or display it on a new screen
                      }
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[800],
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                // key
                //: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(90.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(110),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(100),
                            child: Image.network(
                              'https://imgtr.ee/images/2023/04/16/yAkhs.jpg',

                              fit: BoxFit.cover,
                              width: 300, // Set the desired width of the image
                              height: 10,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        child: Text(
                          "MOHNISH",
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color:
                                Colors.grey.shade300, // Change the font color
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        child: Text(
                          "\"" + " Data Architect & Developer " + "\"",
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic, // Change the font size
                            fontWeight:
                                FontWeight.normal, // Change the font family
                            color:
                                Colors.grey.shade300, // Change the font color
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<BottomNavigationBarItem> _buildThreeItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_rounded),
        label: 'Food',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
        label: 'About',
      ),
    ];
  }
}

Future<List<Food>?> _getData(String search) async {
  final dio = Dio();
  final response =
      await dio.get('http://192.168.29.175:1234/food/name/' + search);
  print(response.data['data'].toString());
  if (response.data['data'].toString() == "[]") {
    print("--------");

    Fluttertoast.showToast(msg: "Meal Not Found");
    // throw Exception('Failed to load myobjects');
  } else {
    List<Food>? foodFinal = renderArray(
      response.data["data"],
      A: Food,
      obj: List<Food>.filled((response.data["data"] as List).length, Food(),
          growable: false),
    );
    if (foodFinal != null) {
      return foodFinal;
    } else {
      Fluttertoast.showToast(msg: "Servor error contact mohnish");
    }
    // final jsonData = jsonDecode(response.data['data'].toString());
    // return (response.data['data'] as List<dynamic>)
    //     .asMap().forEach((index,item) => Food.fromJson(response.data['data']))
    //     .toList();
    // List<Food>? hop = response.data['data'];
    // print(hop);
    // Food kk = Food.fromJson(response.data["data"]);
    // return response.data['data'];
  }
}

List<Food>? renderArray<T>(List<dynamic>? json, {dynamic A, List? obj}) {
  final List<T> arrayValues = [];

  final List<Food> food = [];
  if (json is List<dynamic> && json.isNotEmpty) {
    json.asMap().forEach((index, val) {
      if (A != null) {
        if (val != null) {
          Food hh = Food.fromJson(val);
          if (hh != null) food.add(hh);
        }
      }
    });
    print(food);
    return food;
  } else {
    return null;
  }
}

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 3,
      ));
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 3,
      ));
}

enum UtilsDataType { date, enumeration, primary, userClass, list, map }
