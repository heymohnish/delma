import 'package:delma/models/user.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class HomePageView extends State<HomePage> {
  // late final int selectedIndex;
  int current_index = 0;
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
                // key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 3.0),
                      Container(
                        child: Text(
                          "Welcome " + value1!.name.toString() + "!\n",
                          style: TextStyle(
                            fontSize: 25, // Change the font size
                            fontWeight:
                                FontWeight.bold, // Change the font family
                            color: Colors.white, // Change the font color
                          ),
                          textAlign: TextAlign.center,
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
      Container(color: Colors.white),
      Container(color: Colors.white),
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
