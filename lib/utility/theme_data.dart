import 'package:fans/utility/colors_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

RxBool isDarkOn = false.obs;

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  // static final darkTheme = ThemeData(
  //     colorScheme: const ColorScheme.dark(),
  //     brightness: Brightness.dark,
  //     fontFamily: 'Inter'
  // );
  // static final lightTheme = ThemeData(
  //   colorScheme: const ColorScheme.light(),
  //     fontFamily: 'Inter'
  // );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    // iconTheme: const IconThemeData(color: colorPrimary),
    // primaryIconTheme: const IconThemeData(color: colorPrimary),
    fontFamily: 'Inter',
    unselectedWidgetColor: colorGrey,
  );

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: colorWhite,
      primaryColor: colorWhite,
      colorScheme: const ColorScheme.light(),
      // iconTheme: IconThemeData(color: colorPrimary),
      unselectedWidgetColor: colorGrey,
      fontFamily: 'Inter');
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return StreamBuilder<Object>(
        stream: isDarkOn.stream,
        builder: (context, snapshot) {
          return Switch.adaptive(
            activeColor: colorPrimary,
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              // isDarkOn.value = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark;
              final provider = Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(value);
              isDarkOn.value = value;
              isDarkOn.refresh();
              print('opopopoopppo${isDarkOn.value}');
            },
          );
        });
  }
}
