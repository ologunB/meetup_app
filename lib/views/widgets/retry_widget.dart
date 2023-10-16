import 'meetup_text.dart';

class RetryItem extends StatelessWidget {
  const RetryItem({super.key, required this.onTap, this.title});
  final Function() onTap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MeetupText(
            title ?? 'An error occurred, Do you want to retry?',
            fontSize: 16.sp,
            color: AppColors.primary,
            align: TextAlign.center,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                child: MeetupButton(
                  'Retry',
                  buttonColor: Colors.white,
                  height: 40,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  borderRadius: 10.h,
                  onPressed: onTap,
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          )
        ],
      ),
    );
  }
}
