import 'dart:async';

import 'package:bhagavat_geeta/utils/shrHelper.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    ShrHelper shr = ShrHelper();
    shr.introStatus().then(
      (value) {
        if (value == true) {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, '/home'),
          );
        } else {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, '/intro'),
          );
        }
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('assets/images/logo2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
