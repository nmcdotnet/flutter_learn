import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-2.png';
  final random = Random(); // dùng final để khai báo biến không thay đổi giá trị sau khi khởi tạo giúp tối ưu hiệu suất
  var currentDiceRoll = 2;
  void rollDice() {
    // hàm này thông báo cho Flutter rằng state của widget đã thay đổi và cần phải render lại
    setState(() {
      currentDiceRoll = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
          height: 200,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 30),
          ),
          onPressed: rollDice,
          child: const Text("Roll Dice"),
        ),
      ],
    );
  }
}
