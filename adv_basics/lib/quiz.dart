import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    var lengthAns = selectedAnswer.length;
    print("Num answer: $lengthAns ");
    if (selectedAnswer.length == questions.length) {
      setState(() {
        selectedAnswer = [];
        activeScreen = StartScreen(startQuiz);
      });
    }
  }

  void startQuiz() {
    setState(() {
      activeScreen = const Quiz();
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(
        switchScreen); // Stateful widget chưa được tạo ra nên không thể gọi hàm switchScreen bên ngoài hàm initState
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen is QuestionScreen) {
      screenWidget = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.green],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
