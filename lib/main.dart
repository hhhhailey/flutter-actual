import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/user/view/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'NotoSans'), home: const LoginScreen());
  }
}
