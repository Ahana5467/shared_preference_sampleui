import 'package:flutter/material.dart';
import 'package:shared_preference_sampleui/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("Home screen")),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () async {
             final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('isLogged');
            
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          }, child: Text("Logout"))
        ],
      ),
    );
  }
}