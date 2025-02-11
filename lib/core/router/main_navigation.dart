import 'package:flutter/material.dart';
import 'package:pixel_field/features/collection_details/pages/collection_details_page.dart';

import '../../features/collection/pages/collection_page.dart';
import '../constants/app_assets.dart';
import '../widgets/svg_icon.dart';

class MainNavigationPage extends StatefulWidget {
  static const String path = "/";
  static const String name = "mainNavigation";
  const MainNavigationPage({super.key});

  @override
  MainNavigationPageState createState() => MainNavigationPageState();
}

class MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      _pageController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [CollectionPage(), CollectionDetailsPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: SvgIcon(assetName: AppAssets.collection),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(assetName: AppAssets.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
