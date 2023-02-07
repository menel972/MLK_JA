import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();

  StreamSubscription<ConnectivityResult> listenConnectionChanged() =>
      _connectivity.onConnectivityChanged.listen((ConnectivityResult event) {});

  Future<ConnectivityResult> currentConnectivity() async =>
      await _connectivity.checkConnectivity();
}
