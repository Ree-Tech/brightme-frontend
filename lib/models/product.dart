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
    required this.productCategory,
    required this.productVariations,
    required this.productReviews,
    required this.productImages,
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

Product dummyProduct = Product.fromJson({
  "id": 4,
  "name": "Hydration Serum",
  "brand": "Make Over",
  "slug": "hydration-serum",
  "description":
      "A multi-functional gel containing natural Aloe vera that provides extra moisture with a soothing effect and cools dry and reddened skin from the sun. Its unique, light, and non-sticky formula works as an anti-irritant, anti-inflammatory, as a soothing agent for sunburned skin, and helps increase skin resistance (skin barrier)",
  "summary": "face serum",
  "usage":
      "Moisturizer Apply evenly on the skin that is dry, itchy or red. Can be applied on the face, body, feet, hands and hair. • Mask Apply, wait until it dries and then rinse with water. Helps hydration and relieves irritation redness and refreshes facial skin after sunbathing, outdoor activities",
  "recommendations": "dry,acne",
  "discount": "0",
  "product_category_id": "2",
  "created_at": "2023-11-06 17:21:10",
  "updated_at": "2023-11-06 17:21:10",
  "product_category": {
    "id": 2,
    "name": "Popular Products",
    "slug": "popular-products",
    "created_at": "2023-11-06 12:27:44",
    "updated_at": "2023-11-06 12:27:44"
  },
  "product_variations": [
    {
      "id": 5,
      "name": "200ml",
      "price": "50000",
      "product_id": "4",
      "created_at": "2023-11-06 17:22:06",
      "updated_at": "2023-11-06 17:22:06"
    }
  ],
  "product_reviews": [],
  "product_images": [
    {
      "id": 1,
      "img":
          "https://brightmeapi.reetech.site/public/storage/products/serum-1699266070.png",
      "product_id": "4",
      "created_at": "2023-11-06 17:21:10",
      "updated_at": "2023-11-06 17:21:10"
    },
    {
      "id": 2,
      "img":
          "https://brightmeapi.reetech.site/public/storage/products/serum-1699266070.png",
      "product_id": "4",
      "created_at": "2023-11-06 17:21:10",
      "updated_at": "2023-11-06 17:21:10"
    }
  ]
});
