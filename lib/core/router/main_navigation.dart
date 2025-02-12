import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/features/scan/pages/scan_page.dart';
import 'package:pixel_field/features/settings/pages/settings_page.dart';
import 'package:pixel_field/features/shop/pages/shop_page.dart';

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
  int _selectedIndex = 1;

  final PageController _pageController = PageController(initialPage: 1);

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
        children: [ScanPage(), CollectionPage(), ShopPage(), SettingsPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: context.colorScheme.onSecondary,
        unselectedItemColor: context.colorScheme.onSecondary.withValues(alpha: 0.5),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgIcon(
              assetName: AppAssets.scan,
              color: _selectedIndex == 0
                  ? context.colorScheme.onSecondary
                  : context.colorScheme.onSecondary.withValues(alpha: 0.5),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              assetName: AppAssets.collection,
              color: _selectedIndex == 1
                  ? context.colorScheme.onSecondary
                  : context.colorScheme.onSecondary.withValues(alpha: 0.5),
            ),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              assetName: AppAssets.eyeOpened,
              color: _selectedIndex == 2
                  ? context.colorScheme.onSecondary
                  : context.colorScheme.onSecondary.withValues(alpha: 0.5),
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              assetName: AppAssets.settings,
              color: _selectedIndex == 3
                  ? context.colorScheme.onSecondary
                  : context.colorScheme.onSecondary.withValues(alpha: 0.5),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
