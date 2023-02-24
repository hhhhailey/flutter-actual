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
      /*
        * 세션id는 서버에서 보지 않는 이상 아무 의미없는 것.
        * 토큰은 base64 유의미함
        *
        * 토큰 = 헤더 + 페이로드 + 시그니처처
        *
        * 토큰은 데이터베이스에 저장되지 않고 시그니처값을 이용해서 검증할 수 있다.
        * 그래서 검증할때마다 데이터베이스를 매번 들여다볼 필요가 없다. (세션과 완전 큰 차이!)
        *
        * 시그니처 값만 보면은 서버 매번 들어갈 필요없이 데이터릏 함번더 갖동ㄹ 필요가 없어요
        *
        * 정보가 모두 토큰에 담겨져있고 유의미한 정보들이 64로 인코딩되어있기때문에
        * 디코딩해주면 언제 어디서나 누구나 다 볼 수 있어요.
        *
        * 실제 보일 수 있게 해놓은거에요 그렇기때문에 유출이 되도 상관이 없는 정보만 토큰으로 써야되요.
        *
        *
        *
        * */
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
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
