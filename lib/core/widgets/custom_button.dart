import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.text,
    this.onPressed,
  });
  final Color color;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 2,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
