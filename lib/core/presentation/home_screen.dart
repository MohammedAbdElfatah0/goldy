import 'package:flutter/material.dart';
import 'package:goldy/core/widgets/custom_button.dart';

import '../constants/app_color.dart';
import '../constants/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(color: AppColors.goldColor, text: AppString.gold),
          SizedBox(height: 15),
          CustomButton(color: AppColors.silverColor, text: AppString.silver),
        ],
      ),
    );
  }
}
