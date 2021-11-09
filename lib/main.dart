import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:zido_app/view/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zido_app/view_model/home_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      saveLocale: true,
      supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US')],
      path: 'assets/languages',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [ChangeNotifierProvider.value(value: HomeViewModel())],
        child: MaterialApp(
          title: 'Zido App',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            primaryColor: Color(0xff496EE3),
            textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
          ),
          home: TabsScreen(),
        ),
      ),
    );
  }
}
