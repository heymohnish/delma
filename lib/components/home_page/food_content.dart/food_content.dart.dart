import 'package:flutter/material.dart';
import '../../../models/food.dart';
import './food_content.dart_view.dart';

// class FoodContent.dart extends StatefulWidget {

//   @override
//   FoodContent.dartView createState() => new FoodContent.dartView();
// }

class FoodContent extends StatefulWidget {
  final Food foodObj;
  final String userId;

  const FoodContent({Key? key, required this.foodObj, required this.userId})
      : super(key: key);
  @override
  FoodContentView createState() => new FoodContentView();
}
