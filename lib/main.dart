import 'dart:developer';
import 'package:huubap_task/ui/fizz_buzz_view.dart';
import 'package:huubap_task/ui/home_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huubap_task/common/enum.dart';
import 'package:huubap_task/notifiers/fizz_buzz_notifier/fizz_buzz_notifier.dart';
import 'package:huubap_task/notifiers/theme_notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ResponsiveSizer(
    builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FizzBuzzNotifier()),
          ChangeNotifierProvider(create: (context) => ThemeNotifier())
        ],
        child: Consumer<ThemeNotifier>(
          builder: (BuildContext context, _, Widget? child) {
            return MaterialApp(
              theme: _.getTheme(),
              debugShowCheckedModeBanner: false,
              home: HuuBapTask(),
            );
          },
        ),
      );
    },
  ));
}
