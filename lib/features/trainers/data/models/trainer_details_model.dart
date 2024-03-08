class TrainerDetailsModel {
  List<Data>? data;
  String? message;
  bool? status;

  TrainerDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? type;
  int? age;
  Null? bio;
  String? img;
  bool? subscrip;
  List<String>? works;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    age = json['age'];
    bio = json['bio'];
    img = json['img'];
    subscrip = json['Subscrip'];
    works = json['works'].cast<String>();
  }

}