import 'package:delivery_app/common/component/custom_text_form_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
              child: Column(
        children: [
          CustomTextFormField(
            hintText: "이메일을 입력해주세요",
            onChanged: (value) {},
          ),
          CustomTextFormField(
            hintText: "비밀번호를 입력해주세요",
            obscureText: true,
            onChanged: (value) {},
          ),
        ],
      ))),
    );
  }
}
