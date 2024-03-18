class CategoryModel {
  String? categoryId;
  String? categoryName;
  String? description;
  List<Subcategories>? subcategories;

  CategoryModel(
      {this.categoryId,
      this.categoryName,
      this.description,
      this.subcategories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    description = json['description'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['description'] = description;
    if (subcategories != null) {
      data['subcategories'] = subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  int? subcategoryId;
  String? subcategoryName;
  String? imageUrl;
  List<Products>? products;

  Subcategories(
      {this.subcategoryId, this.subcategoryName, this.imageUrl, this.products});

  Subcategories.fromJson(Map<String, dynamic> json) {
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    imageUrl = json['imageUrl'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcategory_id'] = subcategoryId;
    data['subcategory_name'] = subcategoryName;
    data['imageUrl'] = imageUrl;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  String? productName;
  double? price;
  String? brand;
  String? imageUrl;
  Specifications? specifications;

  Products(
      {this.productId,
      this.productName,
      this.price,
      this.brand,
      this.imageUrl,
      this.specifications});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    price = json['price'];
    brand = json['brand'];
    imageUrl = json['imageUrl'];
    specifications = json['specifications'] != null
        ? Specifications.fromJson(json['specifications'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['price'] = price;
    data['brand'] = brand;
    data['imageUrl'] = imageUrl;
    if (specifications != null) {
      data['specifications'] = specifications!.toJson();
    }
    return data;
  }
}

class Specifications {
  String? screenSize;
  String? camera;
  String? storage;
  String? displaySize;
  String? processor;

  Specifications(
      {this.screenSize,
      this.camera,
      this.storage,
      this.displaySize,
      this.processor});

  Specifications.fromJson(Map<String, dynamic> json) {
    screenSize = json['screen_size'];
    camera = json['camera'];
    storage = json['storage'];
    displaySize = json['display_size'];
    processor = json['processor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['screen_size'] = screenSize;
    data['camera'] = camera;
    data['storage'] = storage;
    data['display_size'] = displaySize;
    data['processor'] = processor;
    return data;
  }
}
