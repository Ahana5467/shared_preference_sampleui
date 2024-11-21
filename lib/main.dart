import 'package:flutter/material.dart';

import 'package:shared_preference_sampleui/view/splash_screen/splash_screen.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}