import 'package:flutter/material.dart';
import 'package:shared_preference_sampleui/view/home_screen/home_screen.dart';
import 'package:shared_preference_sampleui/view/register_screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isOn = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Sign in to Your Account",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                  validator: (value){
                   String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                     RegExp regex = RegExp(pattern);
                     if(value != null && regex.hasMatch(value)){
                      return null;
                     }
                     else{
                      return 'Enter a valid email';
                     }
                },
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your Email Address"
                ),
              ),
              SizedBox(height: 20),
               TextFormField(
                  obscureText: true,
                  validator: (value){
                  if(value==null || value.isEmpty){
                    return "Enter a valid password";
                  }
                  else if(value.length<6){
                    return"Password must contain atleast 6 characters";
                  }
                  else{
                    return null;
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your password",
                  suffixIcon: Icon(Icons.remove_red_eye)
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(value: isOn, onChanged: (value) {
                    isOn = value!;
                  },),
                  Expanded(child: Text("Remember Me",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)),
                  InkWell(
                    onTap: () {},
                    child: Text("Forgot Password",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),)),
                ],
              ),
              InkWell(
                onTap: () async {
                  String email = emailController.text;
                  String password = passwordController.text;
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  final bool? isRegister = prefs.getBool('isRegister');
                  final String? regemail = prefs.getString('email');
                  final String? regpassword = prefs.getString('email');
                  if(_formKey.currentState!.validate()){
                  if(isRegister==true &&  email==regemail && password == regpassword){
                    await prefs.setBool('isLogged', true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  }
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.blue),
                  child: Center(child: Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 16),),),
                  ),
              ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                  
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                    },
                    child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),)),
            ],
          ),
            ]
          ),
        ),
      ),
    );
  }
}