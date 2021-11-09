import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zido_app/utilities/app_images.dart';

class HomeViewModel extends ChangeNotifier {
  String local = 'en';
  List<String> sliderImages = [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3
  ];

  List<String> latestItems = [AppImages.car, AppImages.homeDecor];

  List<String> privateItems = [AppImages.private1, AppImages.private2];

  List<String> postsItems = [AppImages.post1, AppImages.post2];

  changeLang(BuildContext context) {
    local == 'ar' ? local = 'en' : local = 'ar';
    notifyListeners();
    local == 'ar'
        ? context.setLocale(Locale('en', 'US'))
        : context.setLocale(Locale('ar', 'EG'));
    notifyListeners();
  }
}
