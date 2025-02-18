import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/my_botton.dart';
import '../widgets/my_textfield.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  // Function to handle user sign-up
  void createUserWithEmailAndPassword(BuildContext context) {
    String fullname = fullnameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String repassword = repasswordController.text;

    // Check if all fields are filled
    if (fullname.isEmpty || email.isEmpty || password.isEmpty || repassword.isEmpty) {
      _showErrorDialog(context, "Please fill in all fields.");
      return;
    }

    // Check if password and re-entered password match
    if (password != repassword) {
      _showErrorDialog(context, "Passwords do not match.");
      return;
    }

    // Your sign-up logic here
    // Example: You can create a user with email and password
    // FirebaseAuth.instance.createUserWithEmailAndPassword(email, password);

    // On successful sign-up, navigate to the sign-in screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  // Helper function to show an error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome Text
            Text(
              "Welcome to our community.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(height: 10),

            // Info Text
            Text(
              "\nTo get started, please provide your information and create an account.\n",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),

            // Full name TextField
            MyTextField(
              controller: fullnameController,
              labelText: "Name",
              obscureText: false,
              hintText: "Enter your name.",
            ),
            SizedBox(height: 20),

            // Email TextField
            MyTextField(
              controller: emailController,
              labelText: "Email",
              obscureText: false,
              hintText: "Enter your email.",
            ),
            SizedBox(height: 20),

            // Password TextField
            MyTextField(
              controller: passwordController,
              labelText: "Password",
              obscureText: true,
              hintText: "Enter your password.",
            ),
            SizedBox(height: 20),

            // Re-enter Password TextField
            MyTextField(
              controller: repasswordController,
              labelText: "Re-password",
              obscureText: true,
              hintText: "Enter your password again.",
            ),
            SizedBox(height: 20),

            // Sign-up Button
            MyButton(
              onTap: () => createUserWithEmailAndPassword(context),
              hinText: "Sign up",
            ),
            SizedBox(height: 20),

            // Have a member? Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have a member?',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign in.',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
