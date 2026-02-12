import 'package:flutter/material.dart';
import 'package:goldy/app_goldy.dart';
import 'package:goldy/core/networking/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const AppGoldy());
}
