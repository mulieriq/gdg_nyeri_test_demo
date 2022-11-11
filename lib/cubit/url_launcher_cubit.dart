import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gdg_nyeri_demo/repository/url_launcher_repository.dart';

part 'url_launcher_cubit.freezed.dart';
part 'url_launcher_state.dart';

class UrlLauncherCubit extends Cubit<UrlLauncherState> {
  UrlLauncherCubit({
    required this.urlLauncherRepository,
    UrlLauncherState? state,
  }) : super(
          state ?? UrlLauncherState.initial(),
        );

  final UrlLauncherRepository urlLauncherRepository;

  Future<void> launch(Uri uri) async {
    emit(UrlLauncherState.loading());
    try {
      await urlLauncherRepository.launch(uri: uri);
      emit(UrlLauncherState.success());
    } on UrlLaunchFailure {
      emit(UrlLauncherState.failure(error: 'Could not launch url.'));
    }
  }
}
