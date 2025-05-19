import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';

class DateScroller extends StatefulWidget {
  final List<DateTime> dates;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  const DateScroller({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  });
  @override
  State<DateScroller> createState() => _DateScrollerState();
}

class _DateScrollerState extends State<DateScroller> {
  final ScrollController _scrollController = ScrollController();
  double itemWidth = 87;
  @override
  void didUpdateWidget(DateScroller oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      centerSelectedDate();
    }
  }

  void centerSelectedDate() {
    final selectedIndex = widget.dates.indexWhere((date) =>
        date.year == widget.selectedDate.year &&
        date.month == widget.selectedDate.month &&
        date.day == widget.selectedDate.day);
    if (selectedIndex != -1 && _scrollController.hasClients) {
      final screenWidth = MediaQuery.of(context).size.width;
      final offset = (selectedIndex * itemWidth) - (screenWidth / 2 - itemWidth / 2);
      _scrollController.animateTo(
        offset.clamp(
          _scrollController.position.minScrollExtent,
          _scrollController.position.maxScrollExtent,
        ),
        duration: const Duration(microseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => centerSelectedDate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.dates.length,
        itemBuilder: (context, index) {
          final date = widget.dates[index];
          final isSelected = date.year == widget.selectedDate.year &&
              date.month == widget.selectedDate.month &&
              date.day == widget.selectedDate.day;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                widget.onDateSelected(date);
              },
              child: CommonContainer(
                height: 70.h,
                width: 70.w,
                borderRadius: BorderRadius.circular(8.r),
                color: isSelected ? AppColors.optionButton : Colors.white,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd').format(date),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat('MMM').format(date),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ).paddingAll(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
