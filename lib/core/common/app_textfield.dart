import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:milkride/core/constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? fieldTopText;
  final TextInputType keyboardType;
  final int maxLength;
  final bool isRequired;
  final bool isReadonly;
  final VoidCallback? ontap;
  final String? Function(String?)? onValidate;

  const AppTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.fieldTopText,
    this.keyboardType = TextInputType.text,
    this.maxLength = 100,
    this.isRequired = false,
    this.isReadonly = false,
    this.ontap,
    this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTopText != null && fieldTopText!.isNotEmpty) 
          RichText(
            text: TextSpan(
              text: fieldTopText,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black),
              children: isRequired
                  ? [
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ]
                  : [],
            ),
          ).paddingOnly(bottom: 5.0, left: 5.0),
        TextFormField(
          onTap: ontap,
          readOnly: isReadonly,
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 0),
            fillColor: AppColors.themeIconColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 12.sp),
            counterText: "",
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:BorderSide(color: Colors.blue, width: 2),
            ),
            
          ),
          
          validator: onValidate ?? (value) {
            if (isRequired && (value == null || value.trim().isEmpty)) {
              return "";
            }
            return null;
          },
        ).paddingOnly(bottom: 10.h)
      ],
    );
  }
}


// class AppTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final String? fieldTopText;
//   final TextInputType keyboardType;
//   final int maxLength;
//   final bool isOptional;

//   const AppTextField({
//     super.key,
//     required this.controller,
//     required this.labelText,
//     this.fieldTopText,
//     this.keyboardType = TextInputType.text,
//     this.maxLength = 100,
//     this.isOptional = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (fieldTopText != null && fieldTopText!.isNotEmpty && isOptional == true) 
//           AppText(
//           data:   fieldTopText ?? labelText + * // red,
//             fontSize: 12.sp, fontWeight: FontWeight.w500
//           ).paddingOnly(bottom: 5.h,left: 5.w),
//         TextFormField(
//           controller: controller,
//           keyboardType: keyboardType,
//           maxLength: maxLength,
//           decoration: InputDecoration(
//             fillColor: Colors.grey.shade200,
//             filled: true, 
//             labelText: labelText,
//             counterText: "",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.r),
//               borderSide:BorderSide(color: Colors.grey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.r),
//               borderSide: BorderSide(color: Colors.blue, width: 2),
//             ),
//           ),
//         ).paddingOnly(bottom: 10.h)
//       ],
//     );
//   }
// }
