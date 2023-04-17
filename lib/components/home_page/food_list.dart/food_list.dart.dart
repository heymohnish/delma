import 'package:flutter/material.dart';
import '../../../models/food.dart';
import './food_list.dart_view.dart';

class FoodList extends StatefulWidget {
  final List<Food>? foodList;
  final String userId;
  final String serchText;

  const FoodList(
      {Key? key, this.foodList, required this.userId, required this.serchText})
      : super(key: key);
  @override
  FoodListView createState() => new FoodListView();
}
