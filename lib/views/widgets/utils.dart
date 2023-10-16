import 'meetup_text.dart';

Future<dynamic> showCustomDialog(BuildContext context, Widget page,
    [bool close = true]) async {
  FocusScope.of(context).unfocus();
  return await showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isDismissible: close,
    useRootNavigator: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.h),
        topLeft: Radius.circular(20.h),
      ),
    ),
    builder: (c) => page,
  );
}

Future<dynamic> push(
  BuildContext context,
  Widget page, [
  bool dialog = false,
  bool root = true,
]) async {
  FocusScope.of(context).unfocus();
  return await Navigator.of(context, rootNavigator: root).push(
    CupertinoPageRoute(
      builder: (context) => page,
      fullscreenDialog: dialog,
      settings: RouteSettings(arguments: dialog),
    ),
  );
}

void pushReplacement(BuildContext context, Widget page, [bool root = true]) {
  FocusScope.of(context).unfocus();
  Navigator.of(context, rootNavigator: root).pushReplacement(
    CupertinoPageRoute(builder: (context) => page),
  );
}

void pushAndRemoveUntil(BuildContext context, Widget page, [bool root = true]) {
  FocusScope.of(context).unfocus();
  Navigator.of(context, rootNavigator: root).pushAndRemoveUntil(
    CupertinoPageRoute(builder: (context) => page),
    (Route<dynamic> route) => false,
  );
}

class Utils {
  static void offKeyboard() async {
    await SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
  }

  static String formatPhone(String p) {
    p = p.replaceAll('-', '').replaceAll(' ', '');
    p = '0${p.substring(p.length - 10)}';

    if (p.length != 11) return p;

    return '${p.substring(0, 4)} ${p.substring(4, 7)} ${p.substring(7, 11)}';
  }

  static String formatDate(dynamic s) {
    if (s is String) {
      return DateFormat('dd MMM, yyyy').format(DateTime.parse(s));
    } else if (s is DateTime) {
      return DateFormat('dd MMM, yyyy').format(s);
    } else {
      return '';
    }
  }

  static String estimateReadingTime(String text, {int bufferInMinutes = 0}) {
    const int wordsPerMinute = 200;

    int numWords = text.split(RegExp(r'\s+')).length;

    int time = (numWords / wordsPerMinute).ceil() + bufferInMinutes;

    return time == 1 ? '1 min read' : '$time mins read';
  }

  static String formatTime(dynamic s) {
    if (s is String) {
      int? milli = int.tryParse(s);
      if (milli != null) {
        return DateFormat('hh:mm a')
            .format(DateTime.fromMillisecondsSinceEpoch(milli));
      } else {
        return DateFormat('hh:mm a').format(DateTime.parse(s));
      }
    } else {
      return '';
    }
  }

  static Future<DateTime?> chooseDate(BuildContext context,
      [DateTime? start]) async {
    Utils.offKeyboard();
    DateTime? a = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: start ?? DateTime.now(),
      maxTime: DateTime.now().add(const Duration(days: 365)),
      onChanged: (date) {},
      onConfirm: (date) {
        return date;
      },
      currentTime: start ?? DateTime.now(),
    );
    return a;
  }

  static String formatBytes(int? bytes, [int decimals = 2]) {
    bytes = bytes ?? 0;
    if (bytes <= 0) return "0 KB";
    const unit = 1024;
    final int dm = decimals <= 0 ? 0 : decimals;
    final sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

    int i = (log(bytes) / log(unit)).floor();
    return "${(bytes / pow(unit, i)).toStringAsFixed(dm)} ${sizes[i]}";
  }

  static String? isValidPassword(String? value) {
    value = value!.trim();
    if (value.trim().isEmpty) {
      return "Password cannot be empty";
    } else if (value.trim().length < 8) {
      return "Password is too short";
    } else if (!value.trim().contains(RegExp(r'\d'))) {
      return "Password must contain a number";
    } else if (!value.trim().contains(RegExp(r'[a-z]'))) {
      return "Password must contain a lowercase letter";
    } else if (!value.trim().contains(RegExp(r'[A-Z]'))) {
      return "Password must contain a uppercase letter";
    } else if (!value.trim().contains(RegExp(r'[@$!%?&]'))) {
      return "Password must contain a special character(@\$!%?&)";
    }
    return null;
  }

  static String? isConfirmPassword(String? value, String first) {
    value = value!.trim();
    if (value.trim().isEmpty) {
      return "Password cannot be empty";
    } else if (value != first) {
      return "Passwords are not the same";
    }
    return null;
  }

  static String? isValidName(String? value,
      {String type = "Name", int length = 2}) {
    if (value!.isEmpty) {
      return '$type cannot be empty';
    } else if (value.length < length) {
      return '$type is too short';
    } else if (value.length > 100) {
      return '$type max length is 100';
    }
    return null;
  }

  static String? isValidEmail(String? value) {
    value = value!.trim();
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }
}

extension CustomStringExtension on String {
  toTitleCase() {
    final words = toString().toLowerCase().split(' ');
    var newWord = '';
    for (var word in words) {
      if (word.isNotEmpty) {
        newWord += '${word[0].toUpperCase()}${word.substring(1)} ';
      }
    }

    return newWord.trim();
  }

  toJustNumber() {
    return '+1${trim().replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '')}';
  }

  toAmount() {
    return NumberFormat("#,##0.00", "en_US")
        .format(double.tryParse(this) ?? 0.00);
  }

  get png => 'assets/images/$this.png';
  get memoji => 'assets/memojis/$this.png';

  getSingleInitial() => split('')[0].toUpperCase();

  sanitizeToDouble() => double.tryParse(replaceAll(",", ""));
}
