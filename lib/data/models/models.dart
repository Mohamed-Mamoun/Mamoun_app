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
  // Constructor
  UserModel({this.name, this.number, this.email, this.pass});

  //
  UserModel.fromJson(Map map) {
    name = map['name'];
    number = map['phone_Number'];
    email = map['email'];
  }

  String? email;
  String? name;
  String? number;
  String? pass;

  //
  toJson() {
    return {
      'name': name,
      'phone_Number': number,
      'email': email,
    };
  }
}

///////////////////////////////////////////////
class ProductModel {
  // Constructor
  ProductModel(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productDesc,
      this.productImage,
      this.category});

  //
  ProductModel.fromJson(dynamic map) {
    productId = map['id'];
    productName = map['name'];
    productPrice = map['price'];
    productDesc = map['description'];
    productImage = map['image'];
    category = map['category'];
  }

  String? category;
  String? productDesc;
  String? productId;
  String? productImage;
  String? productName;
  String? productPrice;

  //
  toJson() {
    return {
      'id': productId,
      'name': productName,
      'price': productPrice,
      'description': productDesc,
      'image': productImage,
      'category': category,
    };
  }
}

class CartProductModel {
  String? productId;
  String? name;
  String? price;
  String? category;
  String? image;
  int? quantity;

  CartProductModel(
      {this.productId,
      this.name,
      this.image,
      this.category,
      this.price,
      this.quantity});

  // Function To get data from json
  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productId'];
    category = map['category'];
  }

  // Function To convert data To json
  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
      'category': category
    };
  }
}
