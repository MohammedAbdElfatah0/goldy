import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.goldColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
