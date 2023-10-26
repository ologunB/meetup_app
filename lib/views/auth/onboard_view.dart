import 'package:meetup/views/widgets/meetup_text.dart';

import '../../localizations.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int index = 0;
  Timer? timer;
  PageController controller = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (String i in []) {
        precacheImage(AssetImage(i.png), context);
      }
    });
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      index = (index + 1) % 4;
      if (index == 0) {
        controller.jumpToPage(0);
        return;
      }
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utils.offKeyboard();
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 4,
            controller: controller,
            onPageChanged: (i) => setState(() => index = i),
            itemBuilder: (_, i) {
              return Placeholder(
                fallbackHeight: MediaQuery.of(context).size.height,
                fallbackWidth: MediaQuery.of(context).size.width,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Placeholder(fallbackHeight: 153.h),
                MeetupText(
                  AppLocalizations.of(context)!.appName,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  color: Colors.white,
                  align: TextAlign.center,
                ),
                const Spacer(),
                MeetupButton(
                  AppLocalizations.of(context)!.createAccount,
                  buttonColor: AppColors.primary,
                  height: 50,
                  safeArea: false,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.white,
                  borderColor: AppColors.primary,
                  borderRadius: 10.h,
                  onPressed: () {},
                ),
                SizedBox(height: 16.h),
                MeetupButton(
                  AppLocalizations.of(context)!.login,
                  buttonColor: Colors.transparent,
                  height: 50,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  borderRadius: 10.h,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
