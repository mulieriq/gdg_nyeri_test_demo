// ignore_for_file: avoid_print

void main(List<String> args) {
  someWeirdTest(
    test: 'Hello',
  );
}

int sum({
  required int num1,
  required int num2,
}) =>
    num1 + num2;

void someWeirdTest({
  required String test,
}) {
  print('Hello This is a test');
}
