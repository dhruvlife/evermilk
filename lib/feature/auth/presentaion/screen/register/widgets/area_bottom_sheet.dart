import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/presentaion/cubit/area/area_cubit.dart';

class AreaBottomSheet extends StatefulWidget {
  final Region selectedArea;
  final int id;
  final Function(Region) onAreaSelected;
  const AreaBottomSheet({
    super.key,
    required this.selectedArea,
    required this.id,
    required this.onAreaSelected,
  });
  @override
  State<AreaBottomSheet> createState() => _AreaBottomSheetState();
}
class _AreaBottomSheetState extends State<AreaBottomSheet> {
  late Region selectedArea;
  @override
  void initState() {
    super.initState();
    selectedArea = widget.selectedArea;
    context.read<AreaCubit>().getAreasByRegion(regionId: widget.id);
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
                data: AppStrings.addessAreaBottomSheetTitle,
                color: AppColors.themeIconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ).paddingOnly(bottom: 20.h),
          BlocBuilder<AreaCubit, AreaState>(
            builder: (context, state) {
              if (state is AreaLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.area.length,
                    itemBuilder: (context, index) {
                      Region area = state.area[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedArea = area;
                          });
                          widget.onAreaSelected(area);
                        },
                        child: ListTile(
                          title: AppText(data: area.name!),
                        ),
                      );
                    },
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
