class BilanInfo {
  late int id;
  late String tox;
  late String symp;
  late String img;
  late int grade;
  late String created_at;
  late String user;

  BilanInfo(String tox, int id, String symp, String created_at, String img,
      String user, int grade) {
    this.id = id;
    this.tox = tox;
    this.symp = symp;
    this.grade = grade;
    this.created_at = created_at;
    this.img = img;
    this.user = user;
  }

  BilanInfo.fromJson(Map json)
      : id = json['id'],
        symp = json['symp'],
        grade = json['grade'],
        tox = json['tox'],
        img = json['img'],
        created_at = json['created_at'],
        user = json['user'];
  Map toJson() {
    return {
      'id': id,
      'created_at': created_at,
      'tox': tox,
      'img': img,
      'grade': grade,
      'symp': symp,
      'user': user,
    };
  }
}
