import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';

class MyFormField extends StatelessWidget {
  final String hint;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmit;
  final double? fontSize;
  final EdgeInsets? customPadding;
  final TextStyle? hintStyle;
  final FontWeight fontWeight;
  final void Function()? onTap;
  const MyFormField({
    super.key,
    required this.hint,
    required this.onSaved,
    this.validator,
    this.fontWeight = Weights.medium,
    this.minLines,
    this.maxLines,
    this.leadingIcon,
    this.controller,
    this.focusNode,
    this.trailingIcon,
    this.onChanged,
    this.obscureText = false,
    this.maxLength,
    this.keyboardType,
    this.onSubmit,
    this.fontSize = 16,
    this.customPadding,
    this.hintStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      style: GoogleFonts.inter(
        color: ThemeColors.primaryText,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
      obscureText: obscureText,
      cursorColor: ThemeColors.primaryText,
      keyboardType: keyboardType,
      textInputAction: onSubmit != null ? TextInputAction.go : null,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: GoogleFonts.inter(
          color: ThemeColors.secondaryText,
          fontSize: fontSize,
          fontWeight: Weights.reg,
          decoration: TextDecoration.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ThemeColors.secondaryText),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AccentColors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AccentColors.red),
        ),
        filled: true,
        fillColor: ThemeColors.containerOnBackground,
        contentPadding: customPadding ?? const EdgeInsets.all(16),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: 50,
        ),
        prefixIconColor: ThemeColors.primaryText,
        prefixIcon: maxLines != null && leadingIcon != null
            ? Align(
                heightFactor: maxLines!.toDouble(),
                widthFactor: 1,
                alignment: Alignment.topCenter,
                child: leadingIcon,
              )
            : leadingIcon,
        suffixIcon: trailingIcon,
        counterText: '',
      ),
      onFieldSubmitted: onSubmit,
      textAlignVertical: TextAlignVertical.center,
      minLines: minLines,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: maxLength,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
