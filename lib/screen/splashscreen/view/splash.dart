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
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
