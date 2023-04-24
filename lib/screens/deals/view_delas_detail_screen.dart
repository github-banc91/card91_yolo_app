import 'package:flutter/material.dart';

class ViewDealsDetailScreen extends StatefulWidget {
  static const String route = 'ViewDealsDetailScreen';
  const ViewDealsDetailScreen({Key? key}) : super(key: key);

  @override
  State<ViewDealsDetailScreen> createState() => _ViewDealsDetailScreenState();
}

class _ViewDealsDetailScreenState extends State<ViewDealsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.asset(
                'assets/images/Rectangle 144 (1).png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
