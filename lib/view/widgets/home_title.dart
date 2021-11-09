import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zido_app/utilities/app_colors.dart';

class HomeTitle extends StatelessWidget {
  final String? title;
  final Function? onPressed;

  HomeTitle({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Text(title!,
                style: TextStyle(
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
            child: GestureDetector(
              onTap: () => onPressed,
              child: Text('sell_all'.tr(),
                  textScaleFactor: MediaQuery.of(context).size.width * 0.0024,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
