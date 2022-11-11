part of 'url_launcher_cubit.dart';

@freezed
class UrlLauncherState with _$UrlLauncherState {
  factory UrlLauncherState({
    required Status status,
  }) = _UrlLauncherState;
  const UrlLauncherState._();

  factory UrlLauncherState.initial() {
    return UrlLauncherState(
      status: Status.initial,
    );
  }

  factory UrlLauncherState.loading() {
    return UrlLauncherState(status: Status.loading);
  }

  factory UrlLauncherState.success() {
    return UrlLauncherState(
      status: Status.success,
    );
  }

  factory UrlLauncherState.failure({required String error}) {
    return UrlLauncherState(
      status: Status.failure,
    );
  }
}

enum Status { loading, success, error, failure, initial }
