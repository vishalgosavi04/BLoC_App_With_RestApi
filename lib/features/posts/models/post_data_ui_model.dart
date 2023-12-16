import 'dart:convert';
class PostDataUiModel{
    int userId;
    int id;
    String title;
    String body;

    PostDataUiModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    Map<String,dynamic> toMap(){
      return {
        'userId':userId,
        'id': id,
        'title' :title,
        'body' : body,
      };
    }
    factory PostDataUiModel.fromMap(Map<String, dynamic> map) {
    return PostDataUiModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );}

    factory PostDataUiModel.fromJson(Map<String, dynamic> json) => PostDataUiModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}