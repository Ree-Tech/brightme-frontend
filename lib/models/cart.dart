class Cart {
  int id;
  String quantity;
  dynamic orderId;
  String productVariationId;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  ProductVariation productVariation;
  bool isCheck;

  Cart({
    required this.id,
    required this.quantity,
    required this.orderId,
    required this.productVariationId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.productVariation,
    required this.isCheck,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
      id: json["id"],
      quantity: json["quantity"],
      orderId: json["order_id"],
      productVariationId: json["product_variation_id"],
      userId: json["user_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      productVariation: ProductVariation.fromJson(json["product_variation"]),
      isCheck: json["is_check"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "order_id": orderId,
        "product_variation_id": productVariationId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product_variation": productVariation.toJson(),
      };
}

class ProductVariation {
  int id;
  String name;
  String price;
  String productId;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  ProductVariation({
    required this.id,
    required this.name,
    required this.price,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  int priceDiscount(int quantity) {
    int productPrice = int.parse(price);
    int discountProduct = int.parse(product.discount);

    int discountPrice =
        ((productPrice * (discountProduct / 100)) * quantity).toInt();

    return discountPrice;
  }

  String discountProductPrice(int quantity) {
    int productPrice = int.parse(price);
    int discountProduct = int.parse(product.discount);

    int discountPrice =
        ((productPrice - (productPrice * (discountProduct / 100))) * quantity)
            .toInt();

    return discountPrice.toString();
  }

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      ProductVariation(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "product_id": productId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
      };
}

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
  List<ProductImage> productImages;

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
    required this.productImages,
  });

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
        productCategoryId: json["product_category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "product_images":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
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

List<Cart> userCart = [];

int totalDiscountCheckCart() {
  int total = 0;
  for (var item in userCart) {
    if (item.isCheck) {
      int quantity = int.parse(item.quantity);
      int priceProduct = item.productVariation.priceDiscount(quantity);
      total += priceProduct;
    }
  }

  return total;
}

int totalNormalCheckCart() {
  int total = 0;
  for (var item in userCart) {
    if (item.isCheck) {
      int priceProduct =
          int.parse(item.productVariation.price) * int.parse(item.quantity);
      total += priceProduct;
    }
  }

  return total;
}
