import 'package:Khabar/models/source_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SourceItemWidget extends StatelessWidget {
  const SourceItemWidget(
      {super.key, required this.sources, required this.isSelected});
  final Sources sources;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 12.0.h),
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: theme.primaryColor,width: 2.w),
          color: isSelected ? theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Text(
          sources.name ?? '',
          style: theme.textTheme.bodyMedium
              ?.copyWith(color: isSelected ? Colors.white : theme.primaryColor),
        ),
      ),
    );
  }
}
