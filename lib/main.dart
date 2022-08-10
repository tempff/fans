import 'package:country_code_picker/country_localizations.dart';
import 'package:fans/moduls/splash_screen.dart';
import 'package:fans/utility/string_utility.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

final getPreference = GetStorage();

Future<void> secureScreen() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  secureScreen();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [CountryLocalizations.delegate],
            title: appName,
            themeMode: themeProvider.themeMode,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            // initialBinding: AppBinding(),
            // theme: MyTheme
            //     .lightTheme /*(
            //     accentColor: colorPrimary,
            //     fontFamily: 'Inter',
            //     colorScheme: ThemeData().colorScheme.copyWith(primary: colorPrimary),
            //
            //     )*/
            // ,
            // themeMode: themeProvider.themeMode,
            // darkTheme: MyTheme.darkTheme,
            builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: MediaQuery.of(context).size.width,
              minWidth: 420,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(420, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              // background: Container(color: colorWhite)
            ),
            home: const SplashScreen(),
          );
        });
  }
}
