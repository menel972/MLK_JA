import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebView {
  final String url;

  WebView(this.url);

  Future<void> showInternet() async {
    try {
      await launchUrlString(
        url,
        mode: LaunchMode.externalApplication,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> makeCall() async {
    final Uri telLaunchUri = Uri(
      scheme: 'tel',
      path: url,
    );
    try {
      await launchUrl(telLaunchUri, mode: LaunchMode.platformDefault);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
