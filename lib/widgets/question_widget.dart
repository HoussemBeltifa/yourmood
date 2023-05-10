import 'package:flutter/material.dart';
import '../constants.dart'; // it contains our colors.

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Center(
        child: Text(
          'Question ${indexAction + 1}/$totalQuestions:\n $question',textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24.0,
            color: neutral,
          ),
        ),
      ),
    );
  }
}
