// class LikedProduct {
//   int id;
//   int productVariationId;
//   String name;
//   String brand;
//   String discount;
//   List<Img> img;
//   String price;

//   LikedProduct({
//     required this.id,
//     required this.productVariationId,
//     required this.name,
//     required this.brand,
//     required this.discount,
//     required this.img,
//     required this.price,
//   });

//   factory LikedProduct.fromJson(Map<String, dynamic> json) => LikedProduct(
//         id: json["id"],
//         productVariationId: json["product_variation_id"],
//         name: json["name"],
//         brand: json["brand"],
//         discount: json["discount"],
//         img: List<Img>.from(json["img"].map((x) => Img.fromJson(x))),
//         price: json["price"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "product_variation_id": productVariationId,
//         "name": name,
//         "brand": brand,
//         "discount": discount,
//         "img": List<dynamic>.from(img.map((x) => x.toJson())),
//         "price": price,
//       };
// }

// class Img {
//   int id;
//   String img;
//   String productId;
//   DateTime createdAt;
//   DateTime updatedAt;

//   Img({
//     required this.id,
//     required this.img,
//     required this.productId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Img.fromJson(Map<String, dynamic> json) => Img(
//         id: json["id"],
//         img: json["img"],
//         productId: json["product_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "img": img,
//         "product_id": productId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// class DetailLikedProduct {
//   int id;
//   String name;
//   String price;
//   String productId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   ProductData product;

//   DetailLikedProduct({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.productId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.product,
//   });

//   factory DetailLikedProduct.fromJson(Map<String, dynamic> json) =>
//       DetailLikedProduct(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"],
//         productId: json["product_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         product: ProductData.fromJson(json["product"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "product_id": productId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "product": product.toJson(),
//       };
// }

// class ProductData {
//   int id;
//   String name;
//   String brand;
//   String slug;
//   String description;
//   String summary;
//   String usage;
//   String recommendations;
//   String discount;
//   String productCategoryId;
//   DateTime createdAt;
//   DateTime updatedAt;

//   ProductData({
//     required this.id,
//     required this.name,
//     required this.brand,
//     required this.slug,
//     required this.description,
//     required this.summary,
//     required this.usage,
//     required this.recommendations,
//     required this.discount,
//     required this.productCategoryId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//         id: json["id"],
//         name: json["name"],
//         brand: json["brand"],
//         slug: json["slug"],
//         description: json["description"],
//         summary: json["summary"],
//         usage: json["usage"],
//         recommendations: json["recommendations"],
//         discount: json["discount"],
//         productCategoryId: json["product_category_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "brand": brand,
//         "slug": slug,
//         "description": description,
//         "summary": summary,
//         "usage": usage,
//         "recommendations": recommendations,
//         "discount": discount,
//         "product_category_id": productCategoryId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// List<LikedProduct> listLikeProduct = [];
