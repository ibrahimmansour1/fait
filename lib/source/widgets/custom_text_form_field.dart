import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.isPassword = false,
    this.enabled = true,
  }) : super(
          key: key,
        ) {
    obscureText = isPassword;
  }

  final Alignment? alignment;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final bool isPassword;

  final bool enabled;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: widget.width ?? double.maxFinite,
        child: TextFormField(
          cursorColor: Colors.black,
          controller: widget.controller,
          // focusNode: focusNode ?? FocusNode(),
          // autofocus: autofocus!,
          style: widget.textStyle ??
              theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
          obscureText: widget.obscureText!,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines ?? 1,
          decoration: decoration,
          validator: widget.validator,
          enabled: widget.enabled,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: widget.hintText ?? "",
        hintStyle: widget.hintStyle ?? CustomTextStyles.bodyLargeBlack900,
        prefixIcon: widget.prefix,
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.obscureText! ? Icons.visibility : Icons.visibility_off,
                  size: 24.adaptSize,
                  color: appTheme.black900.withOpacity(0.5),
                ),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText!;
                  });
                },
              )
            : widget.suffix,
        suffixIconConstraints: widget.suffixConstraints,
        isDense: true,
        contentPadding: widget.contentPadding ?? EdgeInsets.all(16.h),
        fillColor: widget.fillColor ?? appTheme.indigo30001,
        filled: widget.filled,
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                12.h,
              )),
              borderSide: BorderSide.none,
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                12.h,
              )),
              borderSide: BorderSide.none,
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide(
                color: appTheme.gray30002,
                width: 2,
              ),
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillOnPrimaryContainer => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillBlueGray => OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            12.h,
          ),
          bottomLeft: Radius.circular(
            12.h,
          ),
          bottomRight: Radius.circular(
            12.h,
          ),
        ),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillBlueGray1 => const OutlineInputBorder(
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillCyan => OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.h),
        borderSide: BorderSide.none,
      );
}
