import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

// Hàm init state sẽ chạy khi widget được tạo ra để khởi tạo giá trị cho các thuộc tính như activeScreen bằng cách gán giá trị cho nó là StartScreen(switchScreen)
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    print(screenWidget.toString());
    if (activeScreen is QuestionScreen) {
      screenWidget = const QuestionScreen();
    } else {
      print("Sao ky vay");
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
