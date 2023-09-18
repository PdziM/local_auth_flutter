import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../../constants/enums/supported_device.dart';
import '../../domain/local_auth/repositories/local_auth_repository.dart';

class HomeState extends ChangeNotifier {
  final LocalAuthentication auth = LocalAuthentication();

  final BuildContext context;
  bool authenticated = false;
  bool isAuthenticating = false;
  SupportedDevice supportedDevice = SupportedDevice.unknown;

  HomeState(this.context) {
    init();
  }

  init() {
    isSupportedDevice();
  }

  void isSupportedDevice() {
    auth.isDeviceSupported().then((bool isSupported) {
      supportedDevice =
          isSupported ? SupportedDevice.supported : SupportedDevice.unsupported;
      notifyListeners();
    });
  }

  Future<void> authentication() async {
    isAuthenticating = true;
    notifyListeners();

    try {
      final res = await context.read<LocalAuthUsecase>().authentication();
      res.fold((l) {
        print(l);
      }, (r) {
        authenticated = r;
        notifyListeners();
      });

      isAuthenticating = false;
      notifyListeners();
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
    isAuthenticating = false;
    notifyListeners();
  }
}
