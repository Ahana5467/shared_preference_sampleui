import 'package:flutter/material.dart';
import 'package:shared_preference_sampleui/view/home_screen/home_screen.dart';
import 'package:shared_preference_sampleui/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool? isLogged = prefs.getBool('isLogged');
      if(isLogged==true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(child: Text("Splash screen")),
    );
  }
}