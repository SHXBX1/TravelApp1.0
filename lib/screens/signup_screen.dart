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

  void createUserWithEmailAndPassword(BuildContext context) {
    String fullname = fullnameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String repassword = repasswordController.text;

    if (fullname.isEmpty || email.isEmpty || password.isEmpty || repassword.isEmpty) {
      _showErrorDialog(context, "Please fill in all fields.");
      return;
    }

    if (password != repassword) {
      _showErrorDialog(context, "Passwords do not match.");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
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
      backgroundColor: Colors.blue.shade50, // สีพื้นหลังฟ้าอ่อนเหมือน SignInScreen
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "ยินดีต้อนรับสู่ชุมชนของเรา",
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
              "กรุณาระบุข้อมูลของคุณและสร้างบัญชี",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.blue.shade600, // สีฟ้าปานกลาง
              ),
            ),
            SizedBox(height: 20),

            MyTextField(
              controller: fullnameController,
              labelText: "ชื่อ",
              obscureText: false,
              hintText: "ใส่ชื่อของคุณ.",
            ),
            SizedBox(height: 20),

            MyTextField(
              controller: emailController,
              labelText: "อีเมล",
              obscureText: false,
              hintText: "ใส่อีเมลของคุณ.",
            ),
            SizedBox(height: 20),

            MyTextField(
              controller: passwordController,
              labelText: "รหัสผ่าน",
              obscureText: true,
              hintText: "ใส่รหัสผ่านของคุณ.",
            ),
            SizedBox(height: 20),

            MyTextField(
              controller: repasswordController,
              labelText: "ใส่รหัสผ่านอีกครั้ง",
              obscureText: true,
              hintText: "ใส่รหัสผ่านของคุณอีกครั้ง.",
            ),
            SizedBox(height: 20),

            MyButton(
              onTap: () => createUserWithEmailAndPassword(context),
              hinText: "สมัครสมาชิก",
              buttonColor: Colors.blue.shade600, // สีปุ่มเหมือนกับ SignInScreen
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'มีสมาชิกหรือไม่?',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue.shade600, // สีฟ้าปานกลาง
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
                    'ลงชื่อเข้าใช้',
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
