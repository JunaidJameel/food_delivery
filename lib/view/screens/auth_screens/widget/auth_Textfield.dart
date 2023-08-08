import 'package:flutter/material.dart';
import 'package:design/utils/colors.dart';

class AuthTxtField extends StatelessWidget {
  final TextEditingController? controller;

  final String? validatorTxt;
  final String? labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String)? onchange;

  final TextInputType? keyboardType;
  TextStyle? labelStyle;

  TextInputAction? textInputAction;

  AuthTxtField({
    this.controller,
    this.validatorTxt,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.labelStyle,
    this.textInputAction,
    this.onchange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      textInputAction: textInputAction,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      controller: controller,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(fontWeight: FontWeight.w600),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorTxt;
        }
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: ColorsOfApp.appColor,
        )),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 0),
        filled: true,
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: labelStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color.fromARGB(255, 89, 89, 89)),
      ),
    );
  }
}
