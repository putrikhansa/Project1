class ProductDummy {
  final int id;
  final String title;
  final String description;
  final String brand;
  final String category;
  final double price;
  final String thumbnail;

  ProductDummy({
    required this.id,
    required this.title,
    required this.description,
    required this.brand,
    required this.category,
    required this.price,
    required this.thumbnail,
  });

  factory ProductDummy.fromJson(Map<String, dynamic> json) {
    return ProductDummy(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
