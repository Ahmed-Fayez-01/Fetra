class MealsModel {
  Data? data;
  String? message;
  bool? status;


  MealsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  List<Meal>? meal1;
  List<Meal>? meal2;
  List<Meal>? meal3;
  dynamic? proteinUser;
  dynamic? fatUser;
  dynamic? carbUser;


  Data.fromJson(Map<String, dynamic> json) {
    if (json['meal1'] != null) {
      meal1 = <Meal>[];
      json['meal1'].forEach((v) {
        meal1!.add( Meal.fromJson(v));
      });
    }
    if (json['meal2'] != null) {
      meal2 = <Meal>[];
      json['meal2'].forEach((v) {
        meal2!.add( Meal.fromJson(v));
      });
    }
    if (json['meal3'] != null) {
      meal3 = <Meal>[];
      json['meal3'].forEach((v) {
        meal3!.add( Meal.fromJson(v));
      });
    }
    proteinUser = json['protein_user'];
    fatUser = json['fat_user'];
    carbUser = json['carb_user'];
  }

}

class Meal {
  dynamic? id;
  String? name;
  dynamic? protein;
  dynamic? fats;
  dynamic? carb;
  dynamic? unit;
  String? weight;


  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    protein = json['protein'];
    fats = json['fats'];
    carb = json['carb'];
    unit = json['unit'];
    weight = json['weight'];
  }

}
