import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Iconwidget extends StatelessWidget {
  const Iconwidget({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
  });

  final String title;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
