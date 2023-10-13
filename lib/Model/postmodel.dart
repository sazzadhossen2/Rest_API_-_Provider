class Postmodel {
  Postmodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Postmodel.fromJson(Map<String, dynamic> json) {
    return Postmodel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  final num userId;
  final num id;
  final String title;
  final String body;

  Postmodel copyWith({
    num? userId,
    num? id,
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
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }
}
