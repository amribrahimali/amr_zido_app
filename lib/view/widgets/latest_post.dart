import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zido_app/utilities/app_colors.dart';
import 'package:zido_app/utilities/app_images.dart';

class LatestPostItem extends StatelessWidget {
  final String? imgUrl, title, writerName, tag, time;

  LatestPostItem(
      {this.imgUrl, this.title, this.writerName, this.tag, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 2.0.w, left: 2.0.w),
      child: Stack(children: <Widget>[
        Container(
          height: 20.0.h,
          width: 70.0.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imgUrl!),
            ),
          ),
        ),
        Container(
          height: 20.0.h,
          width: 70.0.w,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.black,
                  ],
                  stops: [
                    0.0,
                    1.0
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                child: Text(
                  title ?? 'title'.tr(),
                  style: TextStyle(
                      color: AppColors.bgColor, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 2.0.h),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.0.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 1.5.h,
                        backgroundImage: AssetImage(AppImages.avatar)),
                    SizedBox(width: 2.0.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(writerName ?? 'user_name'.tr(),
                            style: TextStyle(
                                color: AppColors.bgColor, fontSize: 9.0.sp)),
                        Text(tag ?? '@khadijado',
                            style: TextStyle(
                                color: AppColors.bgColor, fontSize: 9.0.sp))
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 1.0.h),
                      child: Text(time ?? 'date'.tr(),
                          style: TextStyle(color: AppColors.bgColor)),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
