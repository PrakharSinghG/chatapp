import 'package:flutter/material.dart';
import 'package:newapp/services/auth/auth_service.dart';
import 'package:newapp/components/my_button.dart';
import 'package:newapp/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();

    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    else{
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Password don't match!"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpasswordController,
            ),
            const SizedBox(height: 25),
            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
