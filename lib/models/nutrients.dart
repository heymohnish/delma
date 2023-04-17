import 'dart:ffi';

class Nutrients {
  double? ENERC_KCAL;
  double? PROCNT;
  double? FAT;
  double? CHOCDF;
  double? FIBTG;
  Nutrients({
    this.ENERC_KCAL,
    this.PROCNT,
    this.FAT,
    this.CHOCDF,
    this.FIBTG,
  });
  factory Nutrients.fromJson(json) {
    return Nutrients(
        ENERC_KCAL: json["nutrients"]["ENERC_KCAL"],
        PROCNT: json["nutrients"]["PROCNT"],
        FAT: json["nutrients"]["FAT"],
        CHOCDF: json["nutrients"]["CHOCDF"],
        FIBTG: json["nutrients"]["FIBTG"]);
  }
  Nutrients createInstance(json) {
    return Nutrients.fromJson(json);
  }

  toJson() => {
        "ENERC_KCAL": ENERC_KCAL,
        "PROCNT": PROCNT,
        "FAT": FAT,
        "CHOCDF": CHOCDF,
        "FIBTG": FIBTG
      };
}
