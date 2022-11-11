import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_nyeri_demo/cubit/url_launcher_cubit.dart';
import 'package:gdg_nyeri_demo/repository/url_launcher_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mocks.dart';

final uri = Uri.parse('testurl.com');
void main() {
  late MockUrlLauncher mockUrlLauncher;

  setUp(() {
    mockUrlLauncher = MockUrlLauncher();
  });

  group('$UrlLauncherCubit', () {
    group('launch', () {
      blocTest<UrlLauncherCubit, UrlLauncherState>(
        'emits [$UrlLauncherState.loading, $UrlLauncherState.success] when '
        '$UrlLauncherRepository succeeds',
        build: () => UrlLauncherCubit(
          urlLauncherRepository: mockUrlLauncher,
        ),
        setUp: () => when(
          () => mockUrlLauncher.launch(uri: uri),
        ).thenAnswer((_) => Future.value()),
        act: (cubit) => cubit.launch(uri),
        expect: () => <UrlLauncherState>[
          UrlLauncherState.loading(),
          UrlLauncherState.success(),
        ],
      );

      blocTest<UrlLauncherCubit, UrlLauncherState>(
        'emits [$UrlLauncherState.loading, $UrlLauncherState.failure] when '
        '$UrlLauncherRepository throws an $UrlLaunchFailure',
        build: () => UrlLauncherCubit(
          urlLauncherRepository: mockUrlLauncher,
        ),
        setUp: () => when(
          () => mockUrlLauncher.launch(uri: uri),
        ).thenThrow(UrlLaunchFailure()),
        act: (cubit) => cubit.launch(uri),
        expect: () => <UrlLauncherState>[
          UrlLauncherState.loading(),
          UrlLauncherState.failure(
            error: 'Could not launch url.',
          ),
        ],
      );
    });
  });
}
