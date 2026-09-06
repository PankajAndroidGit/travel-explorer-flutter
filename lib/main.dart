import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/main_shell.dart';

void main() {
  runApp(const TravelExplorerApp());
}

class TravelExplorerApp extends StatelessWidget {
  const TravelExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        useMaterial3: true,
      ),
           home: MainShell(),
    );
  }
}