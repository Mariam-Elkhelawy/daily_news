import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key, required this.onTap});
  Function onTap;
  static int categoryID = 1;
  static int settingsID = 2;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.width * .74,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5.r),
          bottomRight: Radius.circular(5.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            color: theme.primaryColor,
            height: mediaQuery.height * .17,
            child: Center(
                child: Image.asset('assets/images/logo.png',height: 70,)
            ),
          ),
          InkWell(
            onTap: () {
              onTap(categoryID);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
              child: Row(
                children: [
                  const ImageIcon(
                    AssetImage('assets/images/ic_list.png'),
                    color: Color(0xFF4F5A69),
                    size: 20,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    local.categories,
                    style: theme.textTheme.titleLarge?.copyWith(
                      height: 1.5.h,
                      fontSize: 22.sp,
                      color: const Color(0xFF4F5A69),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onTap(settingsID);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Row(
                children: [
                  const ImageIcon(
                    AssetImage('assets/images/ic_settings.png'),
                    color: Color(0xFF4F5A69),
                    size: 22,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    local.settings,
                    style: theme.textTheme.titleLarge?.copyWith(
                      height: 1.5.h,
                      fontSize: 22.sp,
                      color: const Color(0xFF4F5A69),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
