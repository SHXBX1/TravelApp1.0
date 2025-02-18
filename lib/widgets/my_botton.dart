import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String hinText;
  final VoidCallback onTap;
  final Color buttonColor; // เพิ่ม parameter สำหรับสีปุ่ม

  const MyButton({
    Key? key,
    required this.hinText,
    required this.onTap,
    this.buttonColor = Colors.blue, // กำหนดค่าเริ่มต้นให้เป็นสีน้ำเงิน
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor, // ใช้ parameter buttonColor
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          hinText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
