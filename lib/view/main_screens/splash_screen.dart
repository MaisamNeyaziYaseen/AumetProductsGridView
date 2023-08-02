import 'package:aumet_trial_products_app/view/main_screens/products_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    splash();
  }

  Future<void> splash() async {
    await Future.delayed(const Duration(seconds: 3));

    if (context.mounted) {
      Navigator.pushReplacement(context,
          PageRouteBuilder(pageBuilder: (context, c, s) => ProductsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff99D1CD),
                Color(0xff9DE8E3),
                Color(0xffD6FAF8),
                Color(0xffffffff),
              ]),
        ),
        child: const Image(
          image: AssetImage("assets/images/aumet_logo.png"),
        ),
      ),
    );
  }
}
