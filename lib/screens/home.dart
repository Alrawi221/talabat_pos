import 'package:flutter/material.dart';
import 'package:talabat_pos/screens/left_home.dart';
import 'package:talabat_pos/screens/right_home.dart';
import 'package:talabat_pos/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          Expanded(flex: 7, child: LeftHome()),
          Expanded(flex: 3, child: RightHome()),
        ],
      ),
    );
  }
}
