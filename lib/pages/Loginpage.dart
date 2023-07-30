import 'package:chatapp_1/components/my_button.dart';
import 'package:chatapp_1/components/my_text_field.dart';
import 'package:chatapp_1/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> signIn() async {
    //auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
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

              //welcome back msg
              const Text(
                "Welcome back you've been missed!",
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

              //sign in btn
              MyButton(onTap: signIn, text: "Sign in"),

              const SizedBox(height: 50),

              //not a mem? reg now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?'),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now',
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
