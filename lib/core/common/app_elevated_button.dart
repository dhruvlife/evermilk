import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double width;
  final Color? backgroundColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child, this.width = double.infinity,this.backgroundColor
    
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width:width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          backgroundColor:backgroundColor?? Colors.blue,
        ),
        child: child,
      ),
    );
  }
}
