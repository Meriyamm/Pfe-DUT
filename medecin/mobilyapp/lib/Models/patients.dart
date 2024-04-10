class PatientInfo {
  late int id;
  late String ip;
  late String name;
  late String sexe;
  late String age;

  PatientInfo(String ip, int id, String name, String age, String sexe) {
    this.id = id;
    this.ip = ip;
    this.name = name;
    this.age = age;
    this.sexe = sexe;
  }

  PatientInfo.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        ip = json['ip'],
        sexe = json['sexe'],
        age = json['age'];
  Map toJson() {
    return {
      'id': id,
      'age': age,
      'ip': ip,
      'sexe': sexe,
      'name': name,
    };
  }
}
