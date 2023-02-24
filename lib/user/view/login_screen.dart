import 'dart:convert';
import 'dart:io';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/common/view/root_tab.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../common/component/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    // localhost
    final emulatorIp = '10.0.2.2:3000';
    final simulatorIp = '127.0.0.1:3000';

    final ip = Platform.isIOS == true ? simulatorIp : emulatorIp;

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
                  onChange: (String value) => username = value,
                  hintText: '이메일을 입력해주세요',
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomTextFormField(
                  obscureText: true,
                  onChange: (String value) => password = value,
                  hintText: '비밀번호를 입력해주세요',
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR, minimumSize: Size.fromHeight(50)),
                  onPressed: () async {
                    final String rawString = '$username:$password';
                    // ** string을 base64로 전환시켜주는 코드
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    // token 만들기
                    String token = stringToBase64.encode(rawString);

                    final resp = await dio.post('http://$ip/auth/login',
                        options: Options(
                            headers: {'authorization': 'Basic $token'}));

                    // flutter store에 access token, refresh token을 저장
                    final refreshToken = resp.data['refreshToken'];
                    final accessToken = resp.data['accessToken'];

                    await storage.write(
                        key: REFRESH_TOKEN_KEY, value: refreshToken);
                    await storage.write(
                        key: ACCESS_TOKEN_KEY, value: accessToken);

                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => RootTab()));
                    print(resp.data);
                  },
                  child: Text('로그인'),
                ),
                SizedBox(height: 16.0),
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
