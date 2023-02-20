///////////////////////////////////////////////

class SiderClass {
  SiderClass({this.title, this.subTitle, this.img});

  //
  String? img;
  String? subTitle;
  String? title;
}
///////////////////////////////////////////////

/// User class
class UserModel {
  String? name;
  String? number;
  String? email;
  String? pass;

  // Constructor
  UserModel({this.name, this.number, this.email, this.pass});

  //
  toJson() {
    return {
      'name': name,
      'phone_Number': number,
      'email': email,
    };
  }

  //
  UserModel.fromJson(Map map) {
    name = map['name'];
    number = map['phone_Number'];
    email = map['email'];
  }
}

///////////////////////////////////////////////