import 'package:flutter/material.dart';
import 'package:yourmood/constants.dart';

class NextButton extends StatefulWidget {
  final int stat;
  const NextButton({Key? key, required this.stat}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        widget.stat==9?'See Result':'Next Question',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
