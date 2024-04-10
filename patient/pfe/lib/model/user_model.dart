class UserInfo {
  String ip;
  String name;
  String dateNaissance;
  String protocol;
  String dateDernierCure;

  UserInfo(
      String name, String ip, String dateNaissance, String dateDernierCure) {
    this.ip = ip;
    this.name = name;
    this.dateNaissance = dateNaissance;
    //this.user_ip = user_ip;
    this.dateDernierCure = dateDernierCure;
  }

  UserInfo.fromJson(Map json)
      : ip = json['ip'],
        dateNaissance = json['dateNaissance'],
        //user_ip = json['user_ip'],
        name = json['name'],
        dateDernierCure = json['dateDernierCure'];
  Map toJson() {
    return {
      'ip': ip,
      'dateDernierCure': dateDernierCure,
      'name': name,
      //'user_ip': user_ip,
      'dateNaissance': dateNaissance,
    };
  }
}
