import 'package:flutter/material.dart';
import 'package:isafetyscan/pages/pick_image.dart';
import 'package:isafetyscan/pages/splashscreen.dart';
import 'package:isafetyscan/provider/count.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Count()),
    ],
    child: MaterialApp(
      // debugShowCheckedModeBanner: false,
      debugShowCheckedModeBanner: false,
      title: "I Safety Scan",
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/pick_image': (context) => const PickImage(),
      },
    ),
  ));
}
