import 'package:flutter/material.dart';
import 'package:shared_preference_sampleui/view/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_formKey ,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Sign Up for Free",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
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
                  hintText: "Your Password",
                  suffixIcon: Icon(Icons.remove_red_eye)
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
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
                controller: confirmController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your Confirm Password",
                  suffixIcon: Icon(Icons.remove_red_eye)
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                  onTap: () async {
                    String email = emailController.text;
                    String password = passwordController.text;
                    String confirmPass = confirmController.text;
                    if(_formKey.currentState!.validate()){
                    if(password==confirmPass && email.isNotEmpty){
                       final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isRegistered', true);
                    await prefs.setString('email', emailController.text);
                    await prefs.setString('password', passwordController.text);
                    Navigator.pop(context);
        
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                    }
                    }
                    
                  },
                   child: Container(
                    padding: EdgeInsets.all(8),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(child: Text("Sign Up")),
                   ),
                 ),
                  Spacer(),
                  Row(
                    children: [
                      Text("Already have an account?",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                  
                       Text("Sign in",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold),),
                    ]
                  )
            ]
          ),
        ),
      )
    );
  }
}
