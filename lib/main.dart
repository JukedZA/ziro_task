import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/pages/splash/splash_page.dart';
import 'package:transaction_management_app/src/stores/app_store.dart';

AppStore appStore = AppStore();
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeColors.background,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: ThemeColors.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.transparent,
          foregroundColor: ThemeColors.primaryIcon,
        ),
      ),
      home: const SplashPage(),
      navigatorKey: navigatorKey,
    );
  }
}
