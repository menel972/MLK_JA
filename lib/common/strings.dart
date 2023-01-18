import 'package:mlk_ja/common/.strings.dart';

class Strings {
  // Button Link
  static String afterFormUrl =
      'https://docs.google.com/forms/d/e/1FAIpQLSconCLW95BB6mkK7rF8tHSKLtaA0mM3p_f1zYTXCKK8LnT8pQ/viewform?usp=sf_link';
  static String instagramUrl = 'https://www.instagram.com/mlkjeunesadultes/';
  static String mlkWebsiteUrl =
      'https://eglisemlk.fr/vie-de-leglise/devenir-equipier/';

  // Eventbrite API
  static String privateToken = PrivateStrings.privateToken;
  static String bearer = 'Bearer $privateToken';
  static String apiKey = PrivateStrings.apiKey;
  static String clientSecret = PrivateStrings.clientSecret;
  static String baseUrl = 'https://www.eventbriteapi.com/v3/';
  static String user = 'users/me/orders/';
  static String oauth = 'https://www.eventbrite.com/oauth/authorize?';
}
