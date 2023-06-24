import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class CustomTabBar extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final bool isCreateEvent;
  final int currentIndex;
  const CustomTabBar({super.key, 
    required this.tabs,
    required this.children,
    this.isCreateEvent = false,
    this.currentIndex = 0,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: widget.tabs.length,
      initialIndex: widget.currentIndex,
    );
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: Stream.value(_tabController.index),
      builder: (context, snapshot) {
        return DefaultTabController(
          length: widget.tabs.length,
          child: Scaffold(
            backgroundColor: AppColors.whiteBgColor,
            body: Stack(
              children: [
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: AppColors.greyFont,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.blackFont,
                    labelStyle: Poppins.bold(AppColors.blackFont).s12,
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.blackFont,
                          AppColors.blackFont,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    tabs: widget.tabs,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TabBarView(
                          controller: _tabController,
                          children: widget.children,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
