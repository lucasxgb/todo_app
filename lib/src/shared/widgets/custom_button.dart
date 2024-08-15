// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
        onPressed: onPressed, //_callingfunc(context),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7)),
        child: text == null
            ? CircularProgressIndicator(
                color: textColor,
              )
            : Text(text!,
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, color: textColor)));
  }
}
