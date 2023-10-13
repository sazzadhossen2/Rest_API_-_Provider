class Postmodel {
  final int userId;
  final int id;
  final String title;
  final String body;

  Postmodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Postmodel.fromJson(Map<String, dynamic> json) {
    return Postmodel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Postmodel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Postmodel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
