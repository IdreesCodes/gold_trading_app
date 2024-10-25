class ProductModel {
  List<Products>? products;
  int? total;
  int? totalPages;
  int? currentPage;

  ProductModel({this.products, this.total, this.totalPages, this.currentPage});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? shortDescription;
  String? description;
  double? price;
  String? stockStatus;
  String? imageUrl;
  bool? galleryImages;
  List<int>? categoryIds;

  Products(
      {this.id,
        this.title,
        this.shortDescription,
        this.description,
        this.price,
        this.stockStatus,
        this.imageUrl,
        this.galleryImages,
        this.categoryIds});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    description = json['description'];
    price = json['price'];
    stockStatus = json['stock_status'];
    imageUrl = json['image_url'];
    galleryImages = json['gallery_images'];
    categoryIds = json['category_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stock_status'] = this.stockStatus;
    data['image_url'] = this.imageUrl;
    data['gallery_images'] = this.galleryImages;
    data['category_ids'] = this.categoryIds;
    return data;
  }
}
