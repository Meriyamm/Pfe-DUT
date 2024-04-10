class CureInfo {
  int id;
  String last;
  String next;
  String analyses;
  // String created_at;

  CureInfo(String last, int id, String next, String analyses) {
    this.id = id;
    this.last = last;
    this.next = next;
    this.analyses = analyses;
    //this.created_at = created_at;
  }

  CureInfo.fromJson(Map json)
      : id = json['id'],
        next = json['next'],
        analyses = json['analyses'],
        last = json['last'];
  //created_at = json['created_at'];
  Map toJson() {
    return {
      'id': id,
      //'created_at': created_at,
      'last': last,
      'analyses': analyses,
      'next': next,
    };
  }
}
