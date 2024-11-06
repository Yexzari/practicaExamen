class Restaurant {
  String id;
  String name;
  String description;
  List<String> images;
  double rating;
  int count;

  Restaurant(
    this.name,
    this.description,
    this.images,
    this.rating,
    this.count,
  ) : id = '';

  // Convertir el restaurante a un mapa para Firebase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': images,
      'rating': rating,
      'count': count,
    };
  }

  // Crear un restaurante desde un mapa
  Restaurant.fromMap(Map<String, dynamic> data, String id)
      : id = id,
        name = data['name'] ?? '',
        description = data['description'] ?? '',
        images = List<String>.from(data['image'] ?? []),
        rating = data['rating']?.toDouble() ?? 0.0,
        count = data['count'] ?? 0;
}
