// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/src/shared/res/enums/input_border_type.dart';

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
  final InputBorderType? borderType;
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
    this.onSaved,
    this.validator,
    this.onChanged,
    this.child,
    this.suffixIcon,
    this.suffix,
    this.borderType,
    this.hintStyle,
    this.expands,
    this.borderSide,
    this.borderRadius,
    this.verticalSpace,
    this.horizontalSpace,
    this.inputFormatters,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
          ? textTheme.labelSmall!.copyWith(
              color: colorScheme.primary.withOpacity(0.2),
            )
          : textTheme.labelSmall!.copyWith(color: Colors.black),
      decoration: InputDecoration(
        hintStyle: textTheme.labelSmall!
            .copyWith(color: colorScheme.primary.withOpacity(.7)),
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffix,
        floatingLabelStyle: textTheme.labelMedium,
        hintText: widget.hintText,

        prefixIcon: widget.prefixIcon,
        border: widget.borderType == InputBorderType.outline
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: BorderSide(
                  color: colorScheme.primary.withOpacity(0.5),
                  width: widget.borderSide ?? 1,
                ))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                color: colorScheme.primary.withOpacity(0.5),
                width: widget.borderSide ?? 1,
              )),

        focusedBorder: widget.borderType == InputBorderType.outline
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: BorderSide(
                  color: colorScheme.primary,
                  width: widget.borderSide ?? 1.2,
                ))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                color: colorScheme.primary,
                width: widget.borderSide ?? 1.2,
              )),
        enabledBorder: widget.borderType == InputBorderType.outline
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: BorderSide(
                  color: colorScheme.primary.withOpacity(0.6),
                  width: widget.borderSide ?? 1,
                ))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                color: colorScheme.primary.withOpacity(0.6),
                width: widget.borderSide ?? 1,
              )),
        // errorBorder: InputBorder.none,
        disabledBorder: widget.borderType == InputBorderType.outline
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                borderSide: BorderSide(
                  color: colorScheme.primary.withOpacity(0.2),
                  width: widget.borderSide ?? 1,
                ))
            : UnderlineInputBorder(
                borderSide: BorderSide(
                color: colorScheme.primary.withOpacity(0.2),
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
