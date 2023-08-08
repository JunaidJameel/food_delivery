import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';

class CategoryTagCustom extends StatelessWidget {
  final String title;
  const CategoryTagCustom({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromARGB(255, 232, 232, 232),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorsOfApp.mediumGreyColor,
                  fontSize: 10,
                ),
          ),
        ),
      ),
    );
  }
}
