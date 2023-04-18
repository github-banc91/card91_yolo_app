import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = "DashboardScreen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
