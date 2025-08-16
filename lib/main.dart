import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'config/theme_manager.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MEP Dubai',
      theme: AppTheme.light(),
      home: const HomeScreen(),
    );
  }
}
