import 'package:flutter/material.dart';
import 'package:someday/common/const/colors.dart';

class TextInput extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final String labelText;
  final int? maxLength;
  final bool isObscure;
  final bool isAutofocus;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const TextInput({
    super.key,
    this.hintText,
    this.errorText,
    required this.labelText,
    this.maxLength,
    this.isObscure = false,
    this.isAutofocus = false,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0));

    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      onChanged: onChanged,
      obscureText: isObscure,
      //비밀번호 입력할때 사용
      autofocus: isAutofocus,
      //화면 나오면 바로 오토포커스를 줄것인지 여부
      decoration: InputDecoration(
        labelText: labelText,
        semanticCounterText: maxLength != null ? '길이 제한 없음' : '최대 $maxLength 까지 입력 가능',
        contentPadding: const EdgeInsets.all(16),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 16.0,
        ),
        fillColor: Colors.white,
        filled: true,
        //배경색을 넣을것인지 여부
        //모든 Input 상태의 기본 스타일링값
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
      maxLength: maxLength,
      textInputAction: TextInputAction.done,
    );
  }
}
