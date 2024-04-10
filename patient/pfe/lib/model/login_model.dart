class UserModel {
  int id;
  String nom;
  String prenom;
  int age;
  String ip;

  UserModel(int id, String nom, String prenom, int age, String ip) {
    this.id = id;
    this.nom = nom;
    this.prenom = prenom;
    this.age = age;
    this.ip = ip;
  }

  UserModel.fromJson(Map json)
      : id = json['id'],
        nom = json['nom'],
        prenom = json['prenom'],
        age = json['age'],
        ip = json['ip'];
  Map toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'age': age,
      'ip': ip,
    };
  }
}
