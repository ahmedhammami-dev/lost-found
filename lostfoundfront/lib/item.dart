class Item {
  final String name, image, location;
  final int id;
  const Item({
    required this.id,
    required this.image,
    required this.name,
    required this.location,
  });
  factory Item.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'location': String location,
        'image': String image,
      } =>
        Item(id: id, name: name, location: location, image: image),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
