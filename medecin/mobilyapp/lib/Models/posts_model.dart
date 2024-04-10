class PostInfo {
  late int id;
  late String content;
  late String created_at;
  late String user;

  PostInfo(
       int id, String content, String created_at, String user) {
    this.id = id;
    this.content = content;
    this.created_at = created_at;
    this.user = user;
  }

  PostInfo.fromJson(Map json)
      : id = json['id'],
        content = json['content'],
        user = json['user'],
        created_at = json['created_at'];
  Map toJson() {
    return {
      'id': id,
      'created_at': created_at,
      'user': user,
      'content': content,
    };
  }
}
