import 'package:flutter/services.dart';
import '../utils/exports.dart';

class CommonTextField extends StatelessWidget {
  final String? text, hintText;
  final TextInputType? inputType;
  final bool obsecureText;
  final TextEditingController? controller;
  final int? maxLine;
  final double? height;
  final FocusNode? focusNode;
  final int? inputLength;
  final Function(String)? onFieldSubmitted;
  final Function? validator;
  final TextInputAction? textInputAction;
  final IconData? iconSuffix;
  final Function()? onSuffixTap;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool? isEnabled;
  bool? isFill = false;
  final Alignment? alignment;
  final Function()? onEditingComplete;

  CommonTextField(
      {Key? key,
      this.text,
      this.controller,
      this.inputType,
      this.obsecureText = false,
      this.maxLine,
      this.height,
      this.inputLength = 100,
      this.focusNode,
      this.onFieldSubmitted,
      this.validator,
      this.iconSuffix,
      this.hintText,
      this.onSuffixTap,
      this.onChanged,
      this.onTap,
      this.isEnabled,
      this.isFill = false,
      this.textInputAction,
      this.alignment,
      this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      alignment: alignment,
      height: height ?? MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: AppColor.mainColor,
          width: 1.5,
        ),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColor.mainColor,
        onChanged: onChanged,
        onTap: onTap,
        style: const TextStyle(
          color: AppColor.primary,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(
              r'(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])')),
          LengthLimitingTextInputFormatter(inputLength), // for mobile
        ],
        textInputAction: textInputAction,
        controller: controller,
        keyboardType: inputType,
        obscureText: obsecureText,
        obscuringCharacter: '*',
        maxLines: maxLine ?? 1,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          isDense: true,
          suffixIcon: IconButton(
              icon: Icon(iconSuffix),
              onPressed: onSuffixTap,
              padding: const EdgeInsets.only(right: 15)),
          contentPadding: EdgeInsets.only(
              left: 15,
              top: 0,
              bottom: 0,
              right: iconSuffix == null ? -35.0 : 0.0),
          hintStyle: const TextStyle(
            color: AppColor.mainColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            // fontFamily: AppTheme.fontNameMontserrat,
          ),
        ),
      ),
    );
  }
}
