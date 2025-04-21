import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/auth/domain/entity/register_source.dart';

class ReferBottomSheet extends StatefulWidget {
  final TextEditingController referCode;
  final TextEditingController agentCode;
  final List<Source> sources;
  final Source source;
  final Function(Source) onSourceSelected;

  const ReferBottomSheet({
    super.key,
    required this.agentCode,
    required this.referCode,
    required this.sources,
    required this.source,
    required this.onSourceSelected,
  });
  @override
  State<ReferBottomSheet> createState() => _ReferBottomSheetState();
}
class _ReferBottomSheetState extends State<ReferBottomSheet> {
  late Source source;
  @override
  void initState() {
    super.initState();
    source = widget.source;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.6.sh,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.themeIconColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.themeBgColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            height: 50.h,
            width: double.infinity,
            child: Center(
              child: AppText(
                data: AppStrings.referBottomSheetTitle,
                color: AppColors.themeIconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.sources.length,
              itemBuilder: (context, index) {
                Source showSource = widget.sources[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      source = showSource;
                    });
                    widget.onSourceSelected(source);
                    Get.back();
                  },
                  child: ListTile(
                    title: AppText(data: showSource.name!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
