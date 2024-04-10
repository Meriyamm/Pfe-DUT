class ToxicityInfo {
  int id;
  String name;
  String description;
  String img;
  int idSymp;

  ToxicityInfo(
      String img, int id, String name, String description, int idSymp) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.img = img;
    this.idSymp = idSymp;
  }

  ToxicityInfo.fromJson(Map json)
      : id = json['id'],
        description = json['description'],
        name = json['name'],
        idSymp = json['idSymp'],
        img = json['img'];
  Map toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'img': img,
      'idSymp': idSymp,
    };
  }
}
