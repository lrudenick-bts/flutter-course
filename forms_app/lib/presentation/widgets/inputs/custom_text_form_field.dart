import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChanged, 
    this.validator, 
    this.obscureText = false,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20)
    );

    final colors = Theme.of(context).colorScheme;

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: colors.primary,
            width: 3
          )
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        // prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        // icon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        // error: Text('Error'),
        errorText: errorMessage,
        errorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.red
          )
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 3
          )
        ),
      ),
    );
  }
}