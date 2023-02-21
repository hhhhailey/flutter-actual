import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final bool autofocus;
  final String? hintText;
  final String? errorText;
  final ValueChanged<String> onChange;

  const CustomTextFormField(
      {required this.onChange,
      this.obscureText = false,
      this.autofocus = false,
      this.hintText,
      this.errorText,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder baseBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: INPUT_BORDER_COLOR, width: 1.0),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText, // 비밀번호 작성할 때 안보이게 해줌
      autofocus: autofocus, // true: 자동 포커스 활성화, false: 자동 포커스 해제
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14.0),
        fillColor: INPUT_BG_COLOR,
        filled: true, // true: 배경색 효과 있음, false: 배경색 효과 없음
        border: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
