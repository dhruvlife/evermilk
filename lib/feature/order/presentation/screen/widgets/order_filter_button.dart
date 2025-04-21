import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/delivery_button.dart';

class OrderFilterButtons extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelected;
  const OrderFilterButtons({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });
  final List<String> tabs = const ["To be delivered", "Delivered", "Refund"];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: index == 1 ? 5.w : 0),
            child: SelectedButton(
              onPressed: () => onSelected(index),
              data: tabs[index],
              isSlected: selectedIndex == index,
            ),
          ),
        );
      }),
    );
  }
}
