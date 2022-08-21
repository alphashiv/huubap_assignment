import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huubap_task/common/enum.dart';
import 'package:huubap_task/notifiers/fizz_buzz_notifier/fizz_buzz_notifier.dart';
import 'package:huubap_task/notifiers/theme_notifier/theme_notifier.dart';
import 'package:huubap_task/ui/fizz_buzz_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HuuBapTask extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeNotifier>(context, listen: false);
    var fizzBuzzProvider =
        Provider.of<FizzBuzzNotifier>(context, listen: false);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only

                onChanged: (number) {
                  if (number.isEmpty) {
                    fizzBuzzProvider.setFizzBuzzGenerator = 1000;
                    return;
                  }
                  ;

                  fizzBuzzProvider.setFizzBuzzGenerator = int.parse(number);
                },
                decoration: InputDecoration(
                    hintText: "Enter Number to generate FizzBuzz"),
              ),
            ),
            FizzBuzzView()
          ],
        ),
      ),
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Switch.adaptive(
                  inactiveTrackColor: Colors.grey,
                  value: themeProvider.themeType,
                  onChanged: (value) {
                    if (value) {
                      themeProvider.changeTheme = ThemeType.DarkTheme;
                    } else {
                      themeProvider.changeTheme = ThemeType.LightTheme;
                    }
                  }),
            ),
          ],
          title: Text(
            "Fizz Buzz",
            style: TextStyle(fontSize: Adaptive.sp(20)),
          )),
    );
  }
}
