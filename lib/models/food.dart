import 'dart:ffi';

import 'nutrients.dart';

class Food {
  String? foodId;
  String? label;
  String? knownAs;
  String? category;
  String? categoryLabel;
  String? image;
  Nutrients? nutrients;
  Food(
      {this.foodId,
      this.label,
      this.knownAs,
      this.category,
      this.categoryLabel,
      this.image,
      this.nutrients});
  factory Food.fromJson(json) {
    return Food(
        foodId: json["foodId"],
        label: json["label"],
        knownAs: json["knownAs"],
        category: json["category"],
        categoryLabel: json["categoryLabel"],
        image: json["image"],
        nutrients: json["nutrients"] != null ? Nutrients.fromJson(json) : null);
  }
  Food createInstance(json) {
    return Food.fromJson(json);
  }

  toJson() => {
        "foodId": foodId,
        "label": label,
        "knownAs": knownAs,
        "category": category,
        "categoryLabel": categoryLabel,
        "image": image,
        "nutrients": nutrients != null ? nutrients!.toJson() : null
      };
}
