class Project {
  final String name;
  final String? description;
  final String? image;
  final String details;

  Project(
      {required this.name,
      this.description,
      this.image,
      required this.details});

  Map<String, dynamic> createMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'details': details
    };
  }

  Project.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        description = map['description'],
        image = map['image'],
        details = map['details'];
}
