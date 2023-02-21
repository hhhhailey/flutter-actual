import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  changeText(value) {
    return print(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              onChange: (String value) => changeText(value),
              hintText: '이메일을 입력해주세요',
            ),
            CustomTextFormField(
              obscureText: true,
              onChange: (String value) => changeText(value),
              hintText: '비밀번호를 입력해주세요',
            ),
          ],
        ),
      ),
    );
  }
}
