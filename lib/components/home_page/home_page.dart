import 'package:delma/models/user.dart';
import 'package:flutter/material.dart';
import './home_page_view.dart';

class HomePage extends StatefulWidget {
  final User? value1;

  const HomePage({Key? key, this.value1}) : super(key: key);
  @override
  HomePageView createState() => new HomePageView();
}
