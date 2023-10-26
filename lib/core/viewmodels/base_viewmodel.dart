import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../views/widgets/snackbar.dart';
import '../models/navigator.dart';

export 'package:meetup/core/models/login_model.dart';
export 'package:meetup/core/services/local_storage.dart';
export 'package:provider/provider.dart';

export '../../locator.dart';
export '../models/error_util.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    if (hasListeners) notifyListeners();
  }

  log(dynamic data) {
    Logger l = Logger();
    l.d(data);
  }

  BuildContext get vmContext => AppNavigator.navKey.currentContext!;

  void showVMSnackbar(String title, {bool err = false}) {
    err ? errorSnackBar(vmContext, title) : successSnackBar(vmContext, title);
  }
}
