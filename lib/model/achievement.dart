class Achievement {
  final String title;
  final String description;
  final String image;

  Achievement({
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> createMap() {
    return {'title': title, 'image': image, 'description': description};
  }

  Achievement.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        image = map['image'],
        description = map['description'];
}
