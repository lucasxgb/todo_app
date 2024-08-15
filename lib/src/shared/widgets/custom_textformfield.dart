// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/src/shared/res/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final double? avaliableHeight;
  final TextAlignVertical? textAlignVertical;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool? obscureText;
  final bool? enabled;
  final bool? readonly;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? child;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextStyle? hintStyle;
  final bool? expands;
  final double? borderSide;
  final double? borderRadius;
  final double? verticalSpace;
  final double? horizontalSpace;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    this.avaliableHeight,
    this.textAlignVertical,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.obscureText,
    this.enabled,
    this.readonly,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.controller,
    this.prefixIcon,
    this.onTap,
    this.onSubmitted,
    required this.onSaved,
    this.validator,
    this.onChanged,
    this.child,
    this.suffixIcon,
    this.suffix,
    this.hintStyle,
    this.expands,
    this.borderSide,
    this.borderRadius,
    this.verticalSpace,
    this.horizontalSpace,
    this.inputFormatters,
  });

  @override
  State<CustomTextFormField> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState
    extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      initialValue: widget.initialValue,
      inputFormatters: widget.inputFormatters,
      textAlignVertical: widget.textAlignVertical,
      enabled: widget.enabled,
      readOnly: widget.readonly ?? false,
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.expands == false ? widget.maxLines ?? 1 : null,
      minLines: widget.expands == false ? widget.minLines ?? 1 : null,
      expands: widget.expands ?? false,
      style: widget.enabled == false
          ? textTheme.labelSmall!.copyWith(color: grayDisabledColor)
          : textTheme.labelSmall!.copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintStyle: widget.hintStyle,
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffix,
        floatingLabelStyle: textTheme.labelMedium,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            borderSide: BorderSide(
              width: widget.borderSide ?? 1,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            borderSide: BorderSide(
              width: widget.borderSide ?? 1,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            borderSide: BorderSide(
              width: widget.borderSide ?? 1,
            )),
        // errorBorder: InputBorder.none,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            borderSide: BorderSide(
              width: widget.borderSide ?? 1,
            )),
        focusedErrorBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            horizontal: widget.horizontalSpace ?? 15,
            vertical: widget.verticalSpace ?? 5),
      ),
      onSaved: widget.onSaved,
      validator: widget.validator,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
    );
  }
}
