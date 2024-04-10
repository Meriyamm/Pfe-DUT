import 'package:flutter/cupertino.dart';

class Symptom {
  //int id;
  String name;
  bool isSelected;
  String imag;

  Symptom(this.name, this.isSelected, this.imag);
}

List<Symptom> symptomList1 = [
  Symptom('التقيؤ', false, 'assets/images/vomiting.png'),
  Symptom('الإسهال', false, ''),
  Symptom('التهاب الغشاء المخاطي', false, ''),
  Symptom('إمساك', false, ''),
];

List<Symptom> cutanee = [
  Symptom('الطفح الجلدي', false, 'assets/images/Picture1.png'),
  Symptom('الأيادي و الأرجل', false, 'assets/images/Picture2.png'),
  Symptom('الأظافر', false, 'assets/images/Picture3.png'),
  Symptom(
      'متابعة التسرب الجلدي السام للخلايا', false, 'assets/images/suivi.jpeg'),
  Symptom('داء الثعلبة', false, 'assets/images/alopecie.png'),
  //Symptom(4, 'constipation', false),
];
List<Symptom> symptomList3 = [
  // Symptom('وخز', false, 'uu'),
  // Symptom('تنميل', false, 'uu'),
  // Symptom('عسر الحس', false, 'uu'),
  // Symptom('الشعور بالحرقة', false, 'uu'),
  Symptom('باطن اليد', false, 'assets/images/paume.jpg'),
  Symptom('باطن القدمين ', false, 'assets/images/plantes.jpg'),
  Symptom('حول الفم ', false, 'assets/images/numbmouth.jpg'),
];
List<Symptom> neuro = [
  Symptom('باطن اليد', false, 'assets/images/paume.jpg'),
  Symptom('باطن القدمين ', false, 'assets/images/plantes.jpg'),
  Symptom('حول الفم ', false, 'assets/images/numbmouth.jpg'),
];
List<Symptom> ocul = [
  Symptom('احمرار', false, 'assets/images/Pink_eye.jpg'),
  Symptom('عيون دامعة ', false, 'assets/images/larmoiement.jpg'),
  Symptom('تورم ', false, 'assets/images/odeme.jpg'),
  Symptom('إحساس بالوخز', false, 'assets/images/picotement.jpeg'),
];
List<Symptom> gon = [
  Symptom('اضطرابات الدورة الشهرية', false, 'assets/images/period.jpeg'),
  Symptom('الاضطرابات الجنسية', false, 'assets/images/sex.jpg'),
  //Symptom('حول الفم ', false, 'assets/images/numbmouth.jpg'),
];
