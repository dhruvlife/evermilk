import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/app_textfield.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/auth/domain/entity/register_source.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/widgets/refer_bottom_sheet.dart';

class ReferPage extends StatefulWidget {
  final List<Source> sources;
  final TextEditingController refercodeController;
  final TextEditingController agentcodeController;
  final VoidCallback onSubmit;
  final ValueChanged<Source> onFindUsSelected;
  const ReferPage({
    super.key,
    required this.agentcodeController,
    required this.refercodeController,
    required this.sources,
    required this.onSubmit,
    required this.onFindUsSelected,
  });
  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  Source selectedSource = Source(name: AppStrings.referSourceHint);
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AppTextField(
        controller: widget.refercodeController,
        hintText: AppStrings.referCodeHint,
        fieldTopText: AppStrings.referCodeLable,
      ),
      AppTextField(
          controller: widget.agentcodeController,
          hintText: AppStrings.referAgentCodeHint,
          fieldTopText: AppStrings.referAgentCodeLable),
      AppTextField(
          hintText: selectedSource.name!,
          fieldTopText: AppStrings.referBottomSheetTitle,
          isReadonly: true,
          ontap: () async {
            Source? newSource = await Get.bottomSheet<Source>(ReferBottomSheet(
                referCode: widget.refercodeController,
                agentCode: widget.agentcodeController,
                sources: widget.sources,
                source: selectedSource,
                onSourceSelected: (Source newSource) {
                  Get.back(result: newSource);
                }));
            if (newSource != null) {
              setState(() {
                selectedSource = newSource;
              });
              widget.onFindUsSelected(newSource);
            }
          }).paddingOnly(bottom: 0.32.sh),
      CustomElevatedButton(
        onPressed: widget.onSubmit,
        child: AppText(data: AppStrings.submit),
      )
    ]).paddingSymmetric(vertical: 40.h);
  }
}
