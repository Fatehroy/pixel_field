import 'package:flutter/material.dart';
import 'package:pixel_field/core/constants/app_assets.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/features/spalsh_screen/widgts/welcome_section.dart';

class SplashScreen extends StatefulWidget {
  static const String path = "/splash-screen";
  static const String name = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _fadeController;

  late final AnimationController _slideController;

  late final Animation<double> _fadeAnimation;

  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_fadeController);

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));
  }

  Future<void> _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await _fadeController.forward();
    await _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildLogoAnimation(),
          _buildSlidingBox(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(AppAssets.background, fit: BoxFit.cover),
    );
  }

  Widget _buildLogoAnimation() {
    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Image.asset(AppAssets.logo),
      ),
    );
  }

  Widget _buildSlidingBox(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(position: _slideAnimation, child: WelcomeSection()),
    );
  }
}
