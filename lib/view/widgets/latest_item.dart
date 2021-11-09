import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zido_app/utilities/app_colors.dart';

class LatestItem extends StatelessWidget {
  final String? imgUrl, description, location, condition;
  final double? price;
  LatestItem(
      {this.imgUrl,
      this.description,
      this.location,
      this.condition,
      this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0.w),
      padding: EdgeInsets.only(top: 2.0.h),
      width: 50.0.w,
      decoration: BoxDecoration(
          color: AppColors.bgCard, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(imgUrl!, width: 45.0.w, fit: BoxFit.contain),
                  Container(
                    color: Colors.grey,
                    margin: EdgeInsets.only(top: 17.0.h),
                    height: 4.1.h,
                    width: 45.0.w,
                    child: Center(
                        child: Text('counter'.tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.0.h),
                child: Row(
                  children: [
                    Text(price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp)),
                    SizedBox(width: 1.5.w),
                    Text('sar'.tr()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                child: Text(description!),
              ),
              SizedBox(height: 1.6.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 28.0.w,
                    height: 3.0.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.8, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(2)),
                    child: Center(
                        child: Text(location!,
                            style: TextStyle(color: AppColors.primaryColor))),
                  ),
                  Container(
                    width: 14.0.w,
                    height: 3.0.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(2)),
                    child: Center(
                        child: Text(condition!,
                            style: TextStyle(color: Colors.green))),
                  )
                ],
              )
            ],
          ),
          Positioned(
            left: 37.0.w,
            top: 1.0.h,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.bgColor),
                child: Icon(Icons.favorite_border, color: Colors.green),
                width: 7.w,
                height: 3.h),
          ),
        ],
      ),
    );
  }
}
