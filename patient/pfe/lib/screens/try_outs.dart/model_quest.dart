import 'package:conditional_questions/conditional_questions.dart';

//import 'package:pfe/screens/try_outs.dart/src/models.dart';

List<Question> questions() {
  return [
    // Question(
    //   question: "What is your name?",
    //   //isMandatory: true,
    //   validate: (field) {
    //     if (field.isEmpty) return "Field cannot be empty";
    //     return null;
    //   },
    // ),
    PolarQuestion(
        question: "Présence de plaintes?",
        answers: ["Oui", "Non"],
        isMandatory: true),
    PolarQuestion(
        question: "Fatigue?", answers: ["Oui", "Non"], isMandatory: true),
    PolarQuestion(
        question: "Capacite de travail?",
        answers: ["Oui", "Non"],
        isMandatory: true),
    PolarQuestion(
        question: "Pouvez vous pratiquer vos activités quotidiennes?",
        answers: ["Oui", "Non"],
        isMandatory: true),
    PolarQuestion(
        question: "autonomie?", answers: ["Oui", "Non"], isMandatory: true),
    PolarQuestion(
        question: "douleur?", answers: ["Oui", "Non"], isMandatory: true),
    PolarQuestion(
        question: "Depression ou anxiété?",
        answers: ["Oui", "Non"],
        isMandatory: true),
    // NestedQuestion(
    //   question: "The series will depend on your answer",
    //   answers: ["Oui", "Non"],
    //   children: {
    //     'Oui': [
    //       PolarQuestion(
    //         question: "Have you ever taken medication for H1n1?",
    //         //answers: ["Oui", "Non"]
    //       ),
    //       PolarQuestion(
    //         question: "Have you ever taken medication for Rabies?",
    //         //answers: ["Oui", "Non"]
    //       ),
    //       // Question(
    //       //   question: "Comments",
    //       // ),
    //     ],
    //     'Non': [
    //       NestedQuestion(
    //           question: "Have you sustained any injuries?",
    //           answers: [
    //             "Oui",
    //             "Non"
    //           ],
    //           children: {
    //             'Oui': [
    //               PolarQuestion(
    //                 question: "Did it result in a disability?",
    //                 //answers: ["Oui", "Non", "I prefer not to say"]
    //               ),
    //             ],
    //             'Non': [
    //               PolarQuestion(
    //                 question: "Have you ever been infected with chicken pox?",
    //                 //answers: ["Oui", "Non"]
    //               ),
    //             ]
    //           }),
    //     ],
    //   },
    // )
  ];
}
