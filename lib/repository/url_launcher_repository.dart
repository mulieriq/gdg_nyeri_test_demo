import 'package:gdg_nyeri_demo/wrapper/url_launcher_service.dart';

class UrlLaunchFailure implements Exception {}

class UrlLauncherRepository {
  UrlLauncherRepository({
    UrlLauncherService? urlLauncherWrapper,
  }) : urlLauncherWrapper = urlLauncherWrapper ?? UrlLauncherService();
  final UrlLauncherService urlLauncherWrapper;

  Future<void> launch({
    required Uri uri,
  }) async {
    try {
      await urlLauncherWrapper.launch(uri: uri);
    } catch (_) {
      throw UrlLaunchFailure();
    }
  }
}
