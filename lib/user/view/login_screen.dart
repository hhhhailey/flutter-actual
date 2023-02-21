import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeText(value) {
      return print(value);
    }

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _Title(),
                Image.asset(
                  'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  onChange: (String value) => changeText(value),
                  hintText: '이메일을 입력해주세요',
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomTextFormField(
                  obscureText: true,
                  onChange: (String value) => changeText(value),
                  hintText: '비밀번호를 입력해주세요',
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR, minimumSize: Size.fromHeight(50)),
                  onPressed: () {},
                  child: Text('로그인'),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        primary: PRIMARY_COLOR,
                        minimumSize: Size.fromHeight(50)),
                    onPressed: () {},
                    child: Text('회원가입'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '환영합니다.',
            style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길 :)',
            style: TextStyle(fontSize: 16, color: BODY_TEXT_COLOR),
          )
        ],
      ),
    );
  }
}
