import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';

class Searchingbar extends StatelessWidget {
  const Searchingbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: secondaryColors,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          hintText: 'Sport arena',
          hintStyle: TextStyle(color: secondaryColors.withOpacity(0.8)),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: secondaryColors,
          )),
    );
  }
}
