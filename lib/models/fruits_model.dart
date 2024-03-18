// ignore_for_file: public_member_api_docs, sort_constructors_first
class FruitsModel {
  String? id;
  String? name;
  String? color;
  String? taste;
  String? description;
  String? imageUrl;
  String? price;
  String? discount;

  FruitsModel(this.id, this.name, this.color, this.taste, this.description,
      this.imageUrl, this.price);

  FruitsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    taste = json['taste'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    data['taste'] = taste;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['price'] = price;
    data['discount'] = discount;
    return data;
  }
}
