class Product {
  int id;
  String name;
  String brand;
  String slug;
  String description;
  String summary;
  String usage;
  String recommendations;
  String discount;
  String productCategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  ProductCategory productCategory;
  List<ProductVariation> productVariations;
  List<dynamic>? productReviews;
  List<ProductImage> productImages;
  bool isLike;
  int? idLike;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.slug,
    required this.description,
    required this.summary,
    required this.usage,
    required this.recommendations,
    required this.discount,
    required this.productCategoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.productVariations,
    required this.productCategory,
    required this.productReviews,
    required this.productImages,
    required this.isLike,
    required this.idLike,
  });

  String discountPrice(int index) {
    int productPrice = int.parse(productVariations[index].price);
    int discountProduct = int.parse(discount);

    int discountPrice =
        productPrice - (productPrice * (discountProduct / 100)).toInt();

    return discountPrice.toString();
  }

  bool hasDiscount() {
    return discount == "0";
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        slug: json["slug"],
        description: json["description"],
        summary: json["summary"],
        usage: json["usage"],
        recommendations: json["recommendations"],
        discount: json["discount"],
        isLike: false,
        idLike: null,
        productCategoryId: json["product_category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productCategory: ProductCategory.fromJson(json["product_category"]),
        productVariations: List<ProductVariation>.from(
            json["product_variations"]
                .map((x) => ProductVariation.fromJson(x))),
        productReviews:
            List<dynamic>.from(json["product_reviews"].map((x) => x)),
        productImages: List<ProductImage>.from(
            json["product_images"].map((x) => ProductImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "slug": slug,
        "description": description,
        "summary": summary,
        "usage": usage,
        "recommendations": recommendations,
        "discount": discount,
        "product_category_id": productCategoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product_category": productCategory.toJson(),
        "product_variations":
            List<dynamic>.from(productVariations.map((x) => x.toJson())),
        "product_reviews": List<dynamic>.from(productReviews!.map((x) => x)),
        "product_images":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
      };
}

class ProductCategory {
  int id;
  String name;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;

  ProductCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class ProductImage {
  int id;
  String img;
  String productId;
  DateTime createdAt;
  DateTime updatedAt;

  ProductImage({
    required this.id,
    required this.img,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        img: json["img"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "product_id": productId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class ProductVariation {
  int id;
  String name;
  String price;
  String productId;
  DateTime createdAt;
  DateTime updatedAt;

  ProductVariation({
    required this.id,
    required this.name,
    required this.price,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      ProductVariation(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "product_id": productId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

List<Product> spescialOffer = [];
List<Product> populerProduct = [];
List<Product> arrivalProduct = [];
List<Product> allProduct = [];
List<Product> listUserLike = [];
