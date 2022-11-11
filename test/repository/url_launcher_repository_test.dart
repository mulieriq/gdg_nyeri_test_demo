import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_nyeri_demo/repository/url_launcher_repository.dart';
import 'package:gdg_nyeri_demo/wrapper/url_launcher_service.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mocks.dart';

final uri = Uri.parse('testurl.com');
void main() {
  late UrlLauncherRepository sut;
  late MockUrlLauncherService mockUrlLauncherService;
  setUp(() {
    mockUrlLauncherService = MockUrlLauncherService();

    sut = UrlLauncherRepository(
      urlLauncherWrapper: mockUrlLauncherService,
    );
  });

  group('$UrlLauncherRepository', () {
    test(
      'launch successfully when'
      '$UrlLauncherService.launch succeeds',
      () async {
        when(() => mockUrlLauncherService.launch(uri: uri))
            .thenAnswer((invocation) => Future.value());

        await sut.launch(uri: uri);
        verify(() => mockUrlLauncherService.launch(uri: uri)).called(1);
      },
    );
    test(
      'throw $UrlLaunchFailure when $UrlLauncherService.launch '
      'can not launch',
      () async {
        when(() => mockUrlLauncherService.launch(uri: uri)).thenThrow(
          UrlLaunchFailure(),
        );

        expect(() => sut.launch(uri: uri), throwsA(isA<UrlLaunchFailure>()));
        verify(() => mockUrlLauncherService.launch(uri: uri)).called(1);
      },
    );
  });
}
