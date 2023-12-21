import 'package:delivery_app/common/const/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
  });

  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: INPUT_BORDER_COLOR,
      width: 1.0,
    ));

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: true,
      autofocus: autofocus,
      autocorrect: false,
      onChanged: (value) {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        filled: true,
        border: baseBorder,
        focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(color: PRIMARY_COLOR)),
      ),
    );
  }
}
