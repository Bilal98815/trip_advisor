import 'package:fluttertoast/fluttertoast.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> launchCustomUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(
        msg: LocaleStrings.urlLauncherError(url.toString()),
      );
    }
  }
}
