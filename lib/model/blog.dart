class Blog {
  final String title;
  final String description;
  final String image;
  final String content;

  Blog({
    required this.title,
    required this.description,
    required this.image,
    required this.content,
  });

  Map<String, dynamic> createMap() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'content': content,
    };
  }

  Blog.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        image = map['image'],
        description = map['description'],
        content = map['content'];
}
