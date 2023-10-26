import 'package:meetup/core/services/base_api.dart';

import '../../views/widgets/meetup_text.dart';

class SettingsVM {
  final StreamController<UserModel> _userController =
      StreamController<UserModel>.broadcast();

  Sink<UserModel> get _inMainUser => _userController.sink;

  Stream<UserModel> get outMainUser => _userController.stream;
  UserModel _currentUser = AppCache.getUser()!.user!;

  UserModel get currentDownloads => _currentUser;

  set currentUser(UserModel i) {
    _currentUser = i;
    _inMainUser.add(i);
  }

  final StreamController<int> _indexController =
      StreamController<int>.broadcast();

  Sink<int> get _inMainIndex => _indexController.sink;

  Stream<int> get outMainIndex => _indexController.stream;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int i) {
    _currentIndex = i;
    _inMainIndex.add(i);
  }
}

SettingsVM settingsVM = SettingsVM();
