import 'package:gdg_nyeri_demo/repository/url_launcher_repository.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class UrlLauncherService {
  Future<void> launch({
    required Uri uri,
  }) async {
    final canLaunchUrl = await launcher.canLaunchUrl(uri);
    if (canLaunchUrl) {
      await launcher.launchUrl(uri);
    } else {
      throw UrlLaunchFailure();
    }
  }
}
