import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questionBank.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 41, 59, 95),
        appBar: AppBar(
          title: Text(
            'Kouiz - Sri Balaji(Dev)',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SenRegular',
              fontSize: 23.0,
              letterSpacing: 2.3,
              wordSpacing: 2.3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<String> questionAnswer = [
  //   'A slug\'s blood is green.',
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.'
  // ];
  // List<bool> answers = [true, false, true];

  List<Bank> questionAns = [
    Bank('Team Panthers is the best team ever', true),
    Bank('Selva is a Single', false),
    Bank('Mahesh is the Aquaman', true),
    Bank('Sri Balaji is a Single', true),
    Bank('Pooja and Sneha are Pros', true),
    Bank('Selva will miss to put VEDI sometimes', false),
    Bank('Mahesh is a developer in VFHU', false),
    Bank('Pradeep is the best in managing works and people', true),
    Bank('Sri Balaji will get Prime Server in CS:GO', false),
    Bank('Selva is not a playgod', false),
    Bank('Baju is a Noob!', true),
    Bank('Mahesh will get only one call daily :)', false),
    Bank(
        'Trionians will publish a app which is going to be world popular soon!',
        true),
  ];
  void showDig() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Well Done! Starting from the beginning.',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'SenRegular',
          fontSize: 18.0,
          letterSpacing: 0.5,
          wordSpacing: 0.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  int currentQuestion = 0;
  List<Widget> stateList = [
    Text(
      'Score: ',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Card(
            color: Color.fromARGB(255, 221, 221, 221),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questionAns[currentQuestion].question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'SenRegular',
                      color: Color.fromARGB(255, 41, 59, 95),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            color: Colors.greenAccent.shade700,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                child: Text(
                  'True',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'SenRegular',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  bool correctAnswer = questionAns[currentQuestion].answers;
                  setState(() {
                    if (correctAnswer == true) {
                      stateList.add(Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                      ));
                    } else {
                      stateList.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    if (currentQuestion == questionAns.length - 1) {
                      showDig();
                      currentQuestion = 0;
                      stateList = [
                        Text(
                          'Score: ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'SenRegular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ];
                      if (questionAns[0].question !=
                          'Love this App developed by Bajuism') {
                        questionAns.insert(0,
                            Bank('Love this App developed by Bajuism', true));
                      }
                    } else {
                      currentQuestion++;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            color: Colors.redAccent,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                child: Text(
                  'False',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  bool correctAnswer = questionAns[currentQuestion].answers;
                  setState(() {
                    if (correctAnswer == false) {
                      stateList.add(Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                      ));
                    } else {
                      stateList.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    if (currentQuestion == questionAns.length - 1) {
                      showDig();
                      currentQuestion = 0;
                      stateList = [
                        Text(
                          'Score: ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'SenRegular',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ];
                      if (questionAns[0].question !=
                          'Love this App developed by Bajuism') {
                        questionAns.insert(0,
                            Bank('Love this App developed by Bajuism', true));
                      }
                    } else {
                      currentQuestion++;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        SafeArea(
          child: Expanded(
            flex: 2,
            child: Row(
              children: stateList,
            ),
          ),
        )
      ],
    );
  }
}

/*
question1:
question2: , true,
question3: , true,
*/
