import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zido_app/utilities/app_colors.dart';
import 'package:zido_app/utilities/app_images.dart';

class PrivateAuctionItem extends StatelessWidget {
  final String? imgUrl, title, userName, tag, time;

  PrivateAuctionItem(
      {this.imgUrl, this.title, this.userName, this.tag, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.0.h,
      margin: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 0.8.h),
      decoration: BoxDecoration(
          color: AppColors.bgCard, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Image.asset(imgUrl!),
          SizedBox(width: 3.0.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.0.h),
              Container(
                width: 59.0.w,
                child: Text(
                  title ?? 'private_dec'.tr(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 1.0.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 1.8.h,
                      backgroundImage: AssetImage(AppImages.avatar)),
                  SizedBox(width: 2.0.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userName ?? 'user_name'.tr(),
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 11.0.sp)),
                      Text(tag ?? '@khadijadosaryong')
                    ],
                  )
                ],
              ),
              SizedBox(height: 1.5.h),
              Row(
                children: [
                  Icon(Icons.timer, color: Colors.green),
                  SizedBox(width: 2.0.w),
                  Text(time ?? '00:10:47'),
                  SizedBox(width: 20.0.w),
                  Container(
                    height: 3.5.h,
                    child: CupertinoButton(
                        color: AppColors.primaryColor,
                        child: Text('join'.tr()),
                        padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                        onPressed: () => {}),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
