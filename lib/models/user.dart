import 'dart:ffi';

class User {
  String? id;
  String? name;
  String? mail;
  String? password;
  String? rePassword;
  String? gender;
  String? bmiNote;
  String? updated;
  String? created;
  double? dob;
  double? height;
  double? weight;
  double? bmr;
  double? bmi;
  double? activeBMR;
  String? level;
  User(
      {this.id,
      this.name,
      this.mail,
      this.password,
      this.rePassword,
      this.gender,
      this.bmiNote,
      this.updated,
      this.created,
      this.dob,
      this.height,
      this.weight,
      this.bmr,
      this.bmi,
      this.activeBMR,
      this.level});

  factory User.fromJson(json) {
    return User(
        id: json["id"],
        name: json["name"],
        mail: json["mail"],
        password: json["password"],
        rePassword: json["rePassword"],
        gender: json["gender"],
        bmiNote: json["bmiNote"],
        updated: json["updated"],
        created: json["created"],
        dob: json["dob"],
        height: json["height"],
        weight: json["weight"],
        bmr: json["bmr"],
        bmi: json["bmi"],
        activeBMR: json["activeBMR"],
        level: json["level"]);
  }
  User createInstance(json) {
    return User.fromJson(json);
  }

  toJson() => {
        "name": name,
        "mail": mail,
        "password": password,
        "rePassword": rePassword,
        "gender": gender,
        "dob": dob,
        "height": height,
        "weight": weight,
        "level": level
      };
}
