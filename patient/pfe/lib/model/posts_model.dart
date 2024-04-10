class PostInfo {
  int id;
  String title;
  String content;
  int nbComment;
  String created_at;

  PostInfo(
      String title, int id, String content, String created_at, int nbComment) {
    this.id = id;
    this.title = title;
    this.content = content;
    this.nbComment = nbComment;
    this.created_at = created_at;
  }

  PostInfo.fromJson(Map json)
      : id = json['id'],
        content = json['content'],
        nbComment = json['nbComment'],
        title = json['title'],
        created_at = json['created_at'];
  Map toJson() {
    return {
      'id': id,
      'created_at': created_at,
      'title': title,
      'nbComment': nbComment,
      'content': content,
    };
  }
}
