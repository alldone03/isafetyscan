import 'dart:async';

import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    void init() {
      // print("aloo");
      Timer(const Duration(milliseconds: 3000), () {
        try {
          Navigator.pushReplacementNamed(context, '/pick_image');
        } catch (e) {
          // print(e);
        }
      });
    }

    init();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child:
                  Image.asset("assets/Image/logo.jpg", width: 150, height: 150),
            ),
          ],
        ),
      ),
    );
  }
}
