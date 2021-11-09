import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:zido_app/utilities/app_colors.dart';
import 'package:zido_app/utilities/app_images.dart';
import 'package:zido_app/view/widgets/fade_animation.dart';
import 'package:zido_app/view/widgets/home_title.dart';
import 'package:zido_app/view/widgets/latest_item.dart';
import 'package:zido_app/view/widgets/latest_post.dart';
import 'package:zido_app/view/widgets/private_item.dart';
import 'package:zido_app/view/widgets/side_animation.dart';
import 'package:zido_app/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.search),
        title: Image.asset(AppImages.logo),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () async {
                await home.changeLang(context);
              },
              child: Icon(Icons.notifications_none)),
          SizedBox(width: 5.0.w)
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.add),
          backgroundColor: AppColors.primaryColor,
          onPressed: () {}),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<HomeViewModel>(
                builder: (ctx, home, _) => Container(
                  height: 15.0.h,
                  width: double.infinity,
                  child: SideInAnimation(
                    2,
                    child: Swiper(
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              width: double.infinity,
                              child: Image.asset(home.sliderImages[index],
                                  fit: BoxFit.fill, width: double.infinity));
                        },
                        itemCount: home.sliderImages.length,
                        pagination:
                            SwiperPagination(builder: SwiperPagination.dots)),
                  ),
                ),
              ),
              HomeTitle(
                title: 'latest_items'.tr(),
                onPressed: () {},
              ),
              Consumer<HomeViewModel>(
                builder: (ctx, home, _) => Container(
                  height: 40.0.h,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: home.latestItems.length,
                      padding: EdgeInsets.only(left: 2.5.w, right: 2.5.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) => FadeInAnimation(
                            index,
                            child: LatestItem(
                                imgUrl: home.latestItems[index],
                                description: 'description'.tr(),
                                location: 'location'.tr(),
                                condition: 'used'.tr(),
                                price: 1200),
                          )),
                ),
              ),
              HomeTitle(
                title: 'private'.tr(),
                onPressed: () {},
              ),
              Consumer<HomeViewModel>(
                builder: (ctx, home, _) => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: home.privateItems.length,
                    itemBuilder: (ctx, index) => SideInAnimation(index,
                        child: PrivateAuctionItem(
                            imgUrl: home.privateItems[index]))),
              ),
              HomeTitle(
                title: 'posts'.tr(),
                onPressed: () {},
              ),
              Consumer<HomeViewModel>(
                builder: (ctx, home, _) => Container(
                  height: 25.0.h,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: home.postsItems.length,
                      padding: EdgeInsets.only(left: 2.5.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) => FadeInAnimation(index,
                          child:
                              LatestPostItem(imgUrl: home.postsItems[index]))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
