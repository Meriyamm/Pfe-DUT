class BilanInfo {
  int id;
  String tox;
  String symp;
  String img;
  int grade;
  String created_at;

  BilanInfo(String tox, int id, String symp, String created_at,String img, int grade) {
    this.id = id;
    this.tox = tox;
    this.symp = symp;
    this.grade = grade;
    this.created_at = created_at;
    this.img = img;
  }

  BilanInfo.fromJson(Map json)
      : id = json['id'],
        symp = json['symp'],
        grade = json['grade'],
        tox = json['tox'],
        img = json['img'],
        created_at = json['created_at'];
  Map toJson() {
    return {
      'id': id,
      'created_at': created_at,
      'tox': tox,
      'img': img,
      'grade': grade,
      'symp': symp,
    };
  }
}
