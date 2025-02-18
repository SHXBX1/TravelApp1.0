import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/my_botton.dart';
import '../widgets/my_iconbtn.dart';
import '../widgets/my_textfield.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signInWithEmailAndPassword(BuildContext context) {
    // เพิ่มตรรกะการลงชื่อเข้าใช้ที่นี่
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog(context, "Please fill Email and Password.");
      return;
    } else
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
  }

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
      backgroundColor: Colors.blue.shade50, // พื้นหลังสีฟ้าอ่อน
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "สวัสดี พร้อมที่จะเริ่มต้นหรือยัง?",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Colors.blue.shade800, // สีฟ้าเข้มสำหรับข้อความ
              ),
            ),
            SizedBox(height: 10),
            Text(
              "กรุณาลงชื่อเข้าใช้ด้วยอีเมลและรหัสผ่านของคุณ",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                color: Colors.blue.shade600, // สีฟ้าปานกลาง
              ),
            ),
            SizedBox(height: 20),
            MyTextField(
              controller: emailController,
              labelText: "อีเมล",
              obscureText: false,
              hintText: "ป้อนอีเมลของคุณ.",
            ),
            SizedBox(height: 20),
            MyTextField(
              controller: passwordController,
              labelText: "รหัสผ่าน",
              obscureText: true,
              hintText: "ป้อนรหัสผ่านของคุณ.",
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'ลืมรหัสผ่านใช่ไหม?',
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
            ),
            SizedBox(height: 20),
            MyButton(
              onTap: () => signInWithEmailAndPassword(context),
              hinText: "ลงชื่อเข้าใช้",
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'หรือดำเนินการต่อด้วย',
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIconButton(imagPath: 'assets/images/google_icon.png'),
                SizedBox(width: 10),
                MyIconButton(imagPath: 'assets/images/apple_icon.png'),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ไม่ใช่สมาชิก?',
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
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'ลงทะเบียนทันที',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue.shade700, // สีฟ้าสำหรับปุ่ม
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
