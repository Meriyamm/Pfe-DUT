import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DigAdvice extends StatelessWidget {
  const DigAdvice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_new),
                  color: Color(0xff25ccb7),
                ),
                Container(
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "سمية",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 15,
                            fontFamily: "DMSans",
                            color: Color(0xFF2F2F3E)),
                      ),
                      Text(
                        "الجهاز الهضمي",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "DMSans",
                            color: Color(0xFF2F2F3E)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            //color: viewModel.color,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Expansiontl(
                    imag: "assets/images/vomit.jpeg",
                    symp: "غثيان / قيء.",
                    adv:
                        'تعزيز الترطيب. \n تقسيم النظام الغذائي: من 6 إلى 8 وجبات صغيرة و / أو وجبات خفيفة في اليوم. \n تقديم وجبات باردة صغيرة لتجنب الروائح الكريهة. \n تجنب الأطعمة الدهنية والمقلية والحارة جدًا. \n اختر الأطعمة سهلة الهضم. \n كل ببطء. \n تقديم المشروبات حسب ذوق المرضى بين الوجبات: ماء ، شاي أعشاب ، عصير تفاح ، كوكاكولا®. \n إذا لزم الأمر ، استخدم مصاصة في كوب مغلق. \n حافظ على وضع الجلوس لمدة 30 دقيقة بعد الوجبة ؛ إذا كنت مستلقيا ، تفضل الجانب الأيمن.',
                  ),
                  Expansiontl(
                    imag: "assets/images/mucite.jpg",
                    symp: "التهاب الغشاء المخاطي.",
                    adv:
                        "فرشاة أسنان نايلون فائقة النعومة. \n تجنب فرش الأسنان الكهربائية. \n تفريش اللثة بعد كل وجبة ، التنظيف المنتظم لأطقم الأسنان. \n معجون أسنان بدون المنثول ، اشطفه جيدًا \n أعواد الجلسرين (إذا تعذر تنظيفها بالفرشاة) \n مشروبات باردة وفوارة ، آيس كريم وأشربة ، فواكه طازجة (قطع كيوي أو أناناس مجمدة). \n زيوت التشحيم على الشفاه. \n غسولات الفم المنتظمة. \n تجنب المطهرات أو غسولات الفم المضادة للفطريات.",
                  ),
                  Expansiontl(
                    imag: "assets/images/diarrhee.jpeg",
                    symp: "إسهال",
                    adv:
                        "تناول 5-6 وجبات صغيرة وخفيفة بدلاً من 3 وجبات دسمة يوميًا. \n اشرب 8-10 أكواب من السوائل يوميًا (ماء ومرق) ما لم يصف طبيبك نظامًا غذائيًا مقيدًا باستخدام الماء. \n قلل من استهلاك الأطعمة والمشروبات التي تحتوي على الكافيين (قهوة ، شاي ، كولا ، شوكولاتة). \n قلل من استهلاك الأطعمة الغنية بالألياف (الفواكه والخضروات النيئة ، عصائر الفاكهة ، الحبوب ، المكسرات ، التمر ، السلطة الخضراء.). \n قلل من استهلاك منتجات الألبان (أو استهلك منتجات خالية من اللاكتوز). \n تجنب الأطعمة الدهنية والحارة جدًا والخوخ. \n موز ، أرز ، عصير تفاح.",
                  ),
                  Expansiontl(
                    imag: "assets/images/diarrhee.jpeg",
                    symp: "إمساك",
                    adv:
                        "اشرب 6-8 أكواب في اليوم. \n زد من تناول أطعمة 'الحبوب' الغنية بالألياف. \n الأنشطة البدنية بشكل منتظم.",
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    ));
  }
}

class Expansiontl extends StatelessWidget {
  FlutterTts flutterTts = FlutterTts();
  String symp;
  String adv;
  String imag;
  Expansiontl({
    Key key,
    @required this.symp,
    @required this.adv,
    @required this.imag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future speak() async {
      await flutterTts.setLanguage("fr-FR");
      //print(await flutterTts.getLanguages);
      await flutterTts.speak(symp + adv);
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.23),
            spreadRadius: -4,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 10),
      child: Column(
        children: <Widget>[
          Image.asset(
            imag,
            width: 250,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ExpansionTile(
              title: Text(
                symp,
                style: TextStyle(fontFamily: "DMSans"),
              ),
              iconColor: Color.fromARGB(255, 69, 180, 164),
              textColor: Color.fromARGB(255, 69, 180, 164),
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => speak(),
                        icon: Icon(Icons.play_arrow_rounded),
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    title: Text(adv, style: TextStyle(fontFamily: "DMSans")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
