import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/widgets/connectivity_listener.dart';

class AppGoldy extends StatelessWidget {
  const AppGoldy({super.key});
  @override
  Widget build(BuildContext context) {
    return ConnectivityListener(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Goldy',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
