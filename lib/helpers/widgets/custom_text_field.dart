import 'package:flutter/material.dart';
import 'package:qis_quiz/extensions/build_context_ext.dart';
import 'package:qis_quiz/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  String? hintText;
  bool? isLink;
  bool? isCalendar;
  bool? isDisabled;
  bool? isRequired;
  final VoidCallback? onTap; // Tambahkan callback onTap

  CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.obscureText = false,
    this.hintText,
    this.suffixIcon,
    this.isRequired = false,
    this.isLink = false,
    this.isCalendar = false,
    this.isDisabled = false,
    this.onTap, // Tambahkan onTap ke constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isRequired == false)
          if (labelText != null)
            Text(
              labelText!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            )
          else
            const SizedBox()
        else
          RichText(
            text: TextSpan(
              text: '$labelText ',
              style: const TextStyle(color: AppColor.udinusGrey, fontSize: 16),
              children: const <TextSpan>[
                TextSpan(
                  text: '*',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          readOnly: isCalendar == true || isDisabled == true,
          onTap: onTap, // Tambahkan onTap untuk memanggil DatePicker
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: isDisabled ?? false
                ? AppColor.udinusGreyLight
                : Colors.white, // Tambahkan warna untuk TextField
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            suffixIcon: suffixIcon != null && isLink == true
                ? Container(
                    constraints: BoxConstraints(
                      minHeight: context.deviceHeight * 0.07,
                      minWidth: context.deviceWidth * 0.15,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: suffixIcon,
                  )
                : suffixIcon,
          ),
        ),
      ],
    );
  }
}
