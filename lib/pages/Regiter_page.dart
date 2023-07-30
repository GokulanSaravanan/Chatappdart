import 'package:chatapp_1/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    if(passwordController.text !=confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("password does not match"),
        ),
      );
      return;
    }
    //get Authservive
    final authService=Provider.of<AuthService>(context, listen: false);
    try{
      await authService.signUpWithEmailAndPassword
      (emailController.text, passwordController.text,
      );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString(),
          ),
          ),
     );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              //logo
              Icon(
                Icons.message_sharp,
                size: 100,
                color: Colors.blue[800],
              ),
              const SizedBox(height: 10),

              //create account
              const Text(
                "Lets create account for you",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),

              //email txtfield

              MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false),
              const SizedBox(height: 25),

              //pwd txtfield

              MyTextField(
                  controller: passwordController,
                  hintText: 'password',
                  obscureText: true),
              const SizedBox(height: 20),

              //confirm password textfield

              MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  obscureText: true),
              const SizedBox(height: 20),

              //sign up btn
              MyButton(onTap: signUp , text: "Sign up"),

              const SizedBox(height: 50),

              //not a mem? reg now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
