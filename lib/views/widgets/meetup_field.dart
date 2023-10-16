import 'meetup_text.dart';

class MeetupField extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String? labelText;
  final String? hintText;
  final String? obscuringCharacter;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextEditingController? controller;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool readOnly;
  final bool? enabled;
  final bool enableCopy;
  final bool obscureText;
  final bool underline;
  final bool? autoFocus;
  final double? radius;
  final Color? hintColor;
  final Color? textColor;
  final Color? color;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  const MeetupField({
    super.key,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.validator,
    this.labelText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.onTap,
    this.autoFocus = false,
    this.focusNode,
    this.maxLength,
    this.enabled,
    this.inputFormatters,
    this.hintColor,
    this.enableCopy = true,
    this.hintText,
    this.color,
    this.textColor,
    this.radius,
    this.onSubmitted,
    this.underline = false,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = underline
        ? UnderlineInputBorder(
            borderSide: BorderSide(width: 1.h, color: const Color(0xffCFCFCF)),
            borderRadius: BorderRadius.circular(radius ?? 5.h),
          )
        : OutlineInputBorder(
            borderSide: BorderSide(width: 1.h, color: const Color(0xffCFCFCF)),
            borderRadius: BorderRadius.circular(radius ?? 5.h),
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          MeetupText(
            labelText!,
            fontSize: 10.sp,
            color: AppColors.grey,
            top: 6.h,
            bottom: 4.h,
          ),
        TextFormField(
          enableInteractiveSelection: enableCopy,
          cursorColor: Colors.black,
          cursorWidth: 1.h,
          focusNode: focusNode,
          textCapitalization: TextCapitalization.sentences,
          maxLines: obscureText ? 1 : maxLines,
          minLines: minLines,
          autofocus: autoFocus!,
          enabled: enabled ?? true,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          style: GoogleFonts.actor(
            color: AppColors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          readOnly: readOnly,
          decoration: InputDecoration(
            counterStyle: const TextStyle(fontSize: 0),
            prefix: SizedBox(width: 12.h),
            prefixIcon: prefix,
            filled: false,
            fillColor: Colors.white,
            contentPadding: maxLines == 1 && !underline
                ? EdgeInsets.zero
                : EdgeInsets.symmetric(vertical: 12.h),
            suffix: suffix,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: GoogleFonts.actor(
              color: hintColor ?? const Color(0xFF868686),
              fontSize: 14.sp,
            ),
            border: border,
            errorBorder: border,
            enabledBorder: border,
            focusedBorder: border,
            focusedErrorBorder: border,
            disabledBorder: border,
            errorText: '',
            errorStyle: GoogleFonts.actor(
              color: Colors.red,
              fontSize: 12.sp,
              height: 0.5,
              fontWeight: FontWeight.w400,
            ),
            errorMaxLines: 1,
          ),
          onTap: onTap,
          onTapOutside: (a) {
            Utils.offKeyboard();
          },
          obscureText: obscureText,
          obscuringCharacter: '●',
          controller: controller,
          textAlign: textAlign ?? TextAlign.start,
          keyboardType: textInputType,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          validator: validator,
        )
      ],
    );
  }
}
