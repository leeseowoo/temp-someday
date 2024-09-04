import 'package:logger/web.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 5, // 출력할 호출 스택의 깊이
    errorMethodCount: 8, // 에러 발생 시 출력할 호출 스택의 깊이
    colors: true, // 컬러 출력 여부
    printEmojis: true, // 이모지 출력 여부
  ),
);