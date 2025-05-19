import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/order/domain/entities/order_reason.dart';

Future<void> showCancelReasonDialog({
  required BuildContext context,
  required List<OrderReasons> reasons,
  required Function(String reasonId) onDeleteConfirm,
}) async {
  String? selectedReasonName;
  String? selectedReasonId;
  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text(AppStrings.selectReason),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () async {
                  final result = await showModalBottomSheet<OrderReasons>(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                    ),
                    builder: (context) {
                      return ListView.builder(
                        itemCount: reasons.length,
                        itemBuilder: (context, index) {
                          final reason = reasons[index];
                          return ListTile(
                            title: Text(reason.name ?? ""),
                            onTap: () {
                              Get.back(result: reason);
                            },
                          );
                        },
                      );
                    },
                  );
                  if (result != null) {
                    setState(() {
                      selectedReasonName = result.name;
                      selectedReasonId = result.id?.toString();
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: AppStrings.reason,
                      hintText: AppStrings.reasonSelectTap,
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                    controller: TextEditingController(text: selectedReasonName),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppStrings.cancel),
            ),
            TextButton(
              onPressed: () {
                if (selectedReasonId != null) {
                  Navigator.pop(context);
                  onDeleteConfirm(selectedReasonId!);
                } else {
                  AppFunctionalComponents.showSnackBar(message:AppStrings.reasonSelect);
                }
              },
              child: Text(AppStrings.delete),
            ),
          ],
        );
      });
    },
  );
}
