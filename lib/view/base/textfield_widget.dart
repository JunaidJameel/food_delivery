import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final Color? hintTextColor;
  final String? hintText;
  final String? validatorTxt;
  final String? labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final Widget? prefixIcon;
  final Color? textfiledColor;
  final TextInputType? keyboardType;
  TextStyle? labelStyle;
  FloatingLabelBehavior? floatingLabelBehavior;
  Function(String)? onchanged;
  TextStyle? hintStyle;
  EdgeInsetsGeometry? contentPadding;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;
  int? maxLength;
  int? maxLines;
  TextFieldWidget({
    this.focusedBorder,
    this.border,
    this.controller,
    this.hintTextColor,
    this.enabledBorder,
    this.hintText,
    this.validatorTxt,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.textfiledColor,
    this.obscureText = false,
    this.keyboardType,
    this.contentPadding,
    this.onchanged,
    this.hintStyle,
    this.floatingLabelBehavior,
    this.labelStyle,
    this.inputFormatters,
    this.textInputAction,
    this.maxLength,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onchanged,
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
        contentPadding: contentPadding ?? const EdgeInsets.only(left: 0),
        filled: true,
        border: border,
        fillColor: textfiledColor,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        focusedBorder: focusedBorder ??
            const OutlineInputBorder(
                borderSide: BorderSide(color: ColorsOfApp.appColor)),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).dividerColor)),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        hintText: hintText,
        hintStyle: hintStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: hintTextColor ?? ColorsOfApp.mediumGreyColor),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: labelStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ColorsOfApp.hintTextColor),
      ),
    );
  }
}
