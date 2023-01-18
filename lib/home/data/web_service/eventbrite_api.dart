// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:mlk_ja/common/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class EventbriteApi {
  Future<void> fecthData() async {
    try {
      final response = await Dio().get(Strings.baseUrl + Strings.user,
          queryParameters: {'token': Strings.privateToken},
          options: Options(headers: {'Authorization': Strings.bearer}));

      print(response.data);
    } on DioError catch (err) {
      print('[DIO ERROR] : $err');
      print('[DIO ERROR RESPONSE] : ${err.response}');
    }
  }

  Future<void> auth() async {
    try {
      final response = await Dio().get(Strings.oauth, queryParameters: {
        'response_type': 'code',
        'client_id': Strings.apiKey,
        'redirect_uri': Uri.parse('http://mlk_ja/oauth2-redirect'),
        // 'redirect_uri': Uri.parse('com.example.mlk-ja://login-callback')
      });

      await launchUrl(response.realUri, mode: LaunchMode.externalApplication);
    } on DioError catch (err) {
      print('[DIO ERROR] : $err');
      print('[DIO ERROR RESPONSE] : ${err.response}');
    }
  }
}
