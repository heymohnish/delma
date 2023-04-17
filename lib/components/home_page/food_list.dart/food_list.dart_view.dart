import 'package:flutter/material.dart';
import '../../../models/food.dart';
import '../food_content.dart/food_content.dart.dart';
import './food_list.dart_view_model.dart';
import 'food_list.dart.dart';

class FoodListView extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    List<Food>? dataq = widget.foodList;
    List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];
    // Replace this with your build function
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("My List"),
      // ),
      body: ListView.builder(
        itemCount: dataq!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              // (if((dataq['image']==null)){123456

              // leading: dataq[index].image != null
              //     ? Image.network(items[index])
              //     : Icon(Icons.image),
              // }else{

              // }
              // leading: Image.network(items[index]),
              title: Text(dataq[index].label ?? "no name"),
              // subtitle: Text("Item ${items[index]}"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Food foodObj = dataq[index];
                print(foodObj.toString());
                // FoodContent
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodContent(
                          foodObj: foodObj, userId: widget.userId.toString())),
                );
                // Call the API here using the ID of the selected object
                // print('Item ${items[index]} tapped!');
              },
            ),
          );
        },
      ),
    );
  }
}
