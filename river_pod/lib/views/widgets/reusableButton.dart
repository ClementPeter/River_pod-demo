import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    this.color,
    this.text,
    this.press,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width, height: 50),
      child: ElevatedButton(
        onPressed: press!,
        style: ElevatedButton.styleFrom(
          backgroundColor: color!,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(text!),
      ),
    );
  }
}
