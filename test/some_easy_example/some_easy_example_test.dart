import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_nyeri_demo/some_example/some_easy_example.dart';

void main() {
  group('Addition', () {
    test(
      "expect an instance of $int",
      () async {
        final total = sum(num1: 1, num2: 2);

        expect(total, isA<int>());
      },
    );
    test(
      "expect 1+2 == 3",
      () async {
        final total = sum(num1: 1, num2: 2);

        expect(total, equals(3));
      },
    );
  });
}
