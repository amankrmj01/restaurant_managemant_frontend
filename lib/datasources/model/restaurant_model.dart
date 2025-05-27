class Restaurant {
  final String? id;
  final String imageUrl;
  final String name;
  final String resType;
  final String rating;
  final String price;
  final String distance;

  Restaurant({
    this.id,
    required this.imageUrl,
    required this.name,
    required this.resType,
    required this.rating,
    required this.price,
    required this.distance,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'].toString(),
      imageUrl: json['imageUrl'] ?? "",
      name: json['name'],
      resType: json['resType'],
      rating: json['rating'],
      price: json['price'],
      distance: json['distance'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['resType'] = resType;
    data['rating'] = rating;
    data['price'] = price;
    data['distance'] = distance;
    return data;
  }
}
