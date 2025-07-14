class TodoModel {
  TodoModel({
    this.id,
    this.title,
    this.completed,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  final String? id;
  final String? title;
  final bool? completed;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      completed: json["completed"] ?? false,
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "completed": completed,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
