import 'package:Khabar/shared/styles/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, this.onChanged, this.onPrefixPressed, this.onSuffixPressed});
  void Function(String)? onChanged;
  void Function()? onPrefixPressed;
  void Function()? onSuffixPressed;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      onChanged: onChanged,
      style: theme.textTheme.bodySmall?.copyWith(color: theme.primaryColor),
      cursorColor: theme.primaryColor,
      cursorHeight: 25,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: onPrefixPressed,
          icon: Icon(
            Icons.close,
            size: 30,
            color: theme.primaryColor,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onSuffixPressed,
          icon: Icon(
            Icons.search,
            color: theme.primaryColor,
            size: 30,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppTheme.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppTheme.primaryColor,
          ),
        ),
      ),
    );
  }
}
