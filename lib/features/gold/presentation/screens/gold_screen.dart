import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_string.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_image.dart';
import '../../data/repo/gold_repo.dart';
import '../cubit/gold_cubit.dart' show GoldCubit;
import '../cubit/gold_state.dart';
import 'widget/custom_text_widget.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(goldRepo: GoldRepo())..getGoldInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppString.gold,
            style: TextStyle(
              color: AppColors.goldColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            return switch (state) {
              GoldLoadingCubit() => const Center(
                child: CircularProgressIndicator(color: AppColors.whiteColor),
              ),

              GoldFailureCubit(:final errorMessage) => Center(
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              ),

              GoldSuccessCubit(:final goldModel) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.goldImage,
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.6,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(title: goldModel.price.toString()),
                      SizedBox(width: 5),
                      CustomTextWidget(title: AppString.usd),
                    ],
                  ),
                ],
              ),

              _ => const SizedBox(),
            };
          },
        ),
      ),
    );
  }
}
