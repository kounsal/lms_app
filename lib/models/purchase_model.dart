class PurchaseModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String type ;
  final String contact;
  final String email;

  PurchaseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.type,
    required this.contact,
    required this.email,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      email: json['email'],
      contact: json['contact'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      type: json['type'],
    );
  }
}