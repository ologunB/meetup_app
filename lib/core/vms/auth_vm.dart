import '../../views/widgets/meetup_text.dart';
import '../apis/auth_api.dart';
import 'base_vm.dart';

class AuthViewModel extends BaseModel {
  final AuthApi _api = locator<AuthApi>();
  String? error;

  Future<bool> signup(String p) async {
    setBusy(true);
    try {
      await _api.signup(p);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> verifyOTP(String? p, String? otp) async {
    setBusy(true);
    try {
      await _api.verifyOTP(p, otp);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> resendPhoneOTP(String? p) async {
    setBusy(true);
    try {
      await _api.resendPhoneOTP(p);
      showVMSnackbar('OTP resent successfully, Check your email');
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> login(String? p, String? pass) async {
    setBusy(true);
    try {
      LoginModel res = await _api.login(p, pass);
      AppCache.setUser(res);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> completeRegister(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      await _api.completeRegister(a);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> updateUser(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      UserModel u = await _api.updateUser(a);
      LoginModel? user = AppCache.getUser();
      user?.user = u;
      AppCache.setUser(user!);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> forgotPassword(String? p) async {
    setBusy(true);
    try {
      await _api.forgotPassword(p);
      setBusy(false);
      showVMSnackbar('Reset OTP resent successfully');
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> verifyForgotOTP(String? p, String? otp) async {
    setBusy(true);
    try {
      await _api.verifyForgotCode(p, otp);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> resetPassword(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      await _api.resetPassword(a);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<bool> changePassword(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      await _api.changePassword(a);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return false;
    }
  }

  Future<RevImage?> uploadMedia(Uint8List bytes) async {
    setBusy(true);
    try {
      RevImage? img = await _api.uploadMedia(bytes);
      LoginModel? user = AppCache.getUser();
      user?.user?.profileImage = img;
      AppCache.setUser(user!);
      setBusy(false);
      return img;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      showVMSnackbar(e.message, err: true);
      return null;
    }
  }

  Future<bool> deleteMedia() async {
    try {
      await _api.deleteMedia();
      LoginModel? user = AppCache.getUser();
      user?.user?.profileImage = null;
      AppCache.setUser(user!);
      setBusy(false);
      return true;
    } on MeetupException catch (e) {
      error = e.message;
      setBusy(false);
      return false;
    }
  }
}
