import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      decoration: InputDecoration(contentPadding: EdgeInsets.all(20)),
    );
  }
}
