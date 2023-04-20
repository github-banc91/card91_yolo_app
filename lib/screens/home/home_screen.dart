import 'package:flutter/material.dart';
import 'package:yolo/screens/home/home_widgets/home_options_widget.dart';
import 'package:yolo/screens/home/home_widgets/top_card.dart';
import 'package:yolo/utils/common_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            const TopCard(),
            getSize(height: 20),
            const HomeOptionsWidget(),
          ],
        ),
      ),
    );
  }
}
