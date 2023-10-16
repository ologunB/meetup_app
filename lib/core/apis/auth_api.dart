import 'dart:typed_data';

import 'base_api.dart';

class AuthApi extends BaseAPI {
  Future<bool> signup(String p) async {
    String url = 'user/register/phone';
    try {
      final Response res = await dio().post(url, data: {'phone_number': p});
      log(res.data);
      switch (res.statusCode) {
        case 201:
          return true;
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> resendPhoneOTP(String? p) async {
    String url = 'user/resend/otp';
    try {
      final Response res = await dio().post(url, data: {'phone_number': p});
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> verifyOTP(String? p, String? otp) async {
    String url = 'user/verify/otp';
    try {
      final Response res =
          await dio().post(url, data: {'phone_number': p, 'otp': otp});
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> completeRegister(Map<String, dynamic> data) async {
    String url = 'user/register/complete';
    try {
      final Response res = await dio().post(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<LoginModel> login(String? p, String? pass) async {
    String url = 'user/login';
    try {
      final Response res =
          await dio().post(url, data: {'phone_number': p, 'password': pass});
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return LoginModel.fromJson(res.data['data']);
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<UserModel> updateUser(Map<String, dynamic> data) async {
    String url = 'user/update-profile';
    try {
      final Response res = await dio().put(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return UserModel.fromJson(res.data['data']);
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<LoginModel> getUser() async {
    String url = 'user/profile';
    try {
      final Response res = await dio().get(url);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return LoginModel.fromJson(res.data);
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  //=========================================================//
  //======================PASSWORD===========================//
  //=========================================================//

  Future<bool> forgotPassword(String? p) async {
    String url = 'user/forgot-password/send';
    try {
      final Response res = await dio().post(url, data: {'phone_number': p});
      log(res.statusCode);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> verifyForgotCode(String? p, String? otp) async {
    String url = 'user/forgot-password/verify';
    try {
      final Response res = await dio()
          .post(url, data: {'phone_number': p, 'forgot_password_code': otp});
      log(res.statusCode);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> resetPassword(Map<String, dynamic> data) async {
    String url = 'user/forgot-password/reset';
    log(data);
    try {
      final Response res = await dio().post(url, data: data);
      log(res.data);
      log(res.statusCode);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> changePassword(Map<String, dynamic> data) async {
    String url = 'user/change-password';
    log(data);
    try {
      final Response res = await dio().post(url, data: data);
      log(res.data);
      log(res.statusCode);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<RevImage> uploadMedia(Uint8List bytes) async {
    String url = 'user/update-profile-image';

    try {
      FormData forms = FormData();
      forms.files.add(
        MapEntry<String, MultipartFile>(
          'image',
          MultipartFile.fromBytes(
            bytes,
            contentType: MediaType('image', 'png'),
            filename: 'p',
          ),
        ),
      );

      final Response res =
          await dio(Headers.multipartFormDataContentType).put(url, data: forms);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return RevImage.fromJson(res.data['data']);
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> deleteMedia() async {
    String url = 'user/remove-profile-image';
    try {
      final Response res = await dio().put(url);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw error(res.data);
      }
    } catch (e) {
      log(e);
      throw MeetupException(DioErrorUtil.handleError(e));
    }
  }
}
