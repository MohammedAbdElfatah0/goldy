import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_string.dart';
import 'package:goldy/features/silver/presentation/cubit/silver_state.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_image.dart';
import '../../data/repo/silver_repo.dart';
import '../cubit/silver_cubit.dart';
import 'widget/custom_text_widget.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SilverCubit(silverRepo: SilverRepo())..getSilverInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppString.silver,
            style: TextStyle(
              color: AppColors.silverColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.silverImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.6,
            ),
            SizedBox(height: 20),
            BlocBuilder<SilverCubit, SilverState>(
              builder: (context, state) {
                return switch (state) {
                  SilverLoadingCubit() => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ),
                  ),

                  SilverFailureCubit(:final errorMessage) => Text(
                    errorMessage,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ),

                  SilverSuccessCubit(:final silverModel) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(title: silverModel.price.toString()),
                      SizedBox(width: 5),
                      CustomTextWidget(title: AppString.usd),
                    ],
                  ),

                  _ => const SizedBox(),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
