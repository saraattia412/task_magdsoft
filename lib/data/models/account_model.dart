class HomeModel {
  int? status;
  String? message;
  List<Products>? products;

  HomeModel({this.status, this.message, this.products});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add( Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;

  Products(
      {this.id,
        this.company,
        this.name,
        this.type,
        this.price,
        this.image,
        this.description});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['company'] = company;
    data['name'] = name;
    data['type'] = type;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}