import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 10,
      color: Color.fromARGB(255, 238, 238, 238),
    );
  }
}
