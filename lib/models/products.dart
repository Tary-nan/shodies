class ProductModel {
  // Propriétés de ma classe
  final int id;
  final String title;
  final String catgorie;
  final String image;
  final String miniDescription;
  final String description;
  final double amount;
  final int size;
  final double starts;
  final bool isFavorite;

  /// Constructeur
  ///

  ProductModel({
    required this.id,
    required this.title,
    this.isFavorite = false,
    required this.image,
    required this.miniDescription,
    required this.description,
    required this.amount,
    required this.size,
    required this.starts,
    required this.catgorie,
  });
}
