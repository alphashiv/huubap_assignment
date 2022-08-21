import 'package:flutter/material.dart';
import 'package:huubap_task/notifiers/fizz_buzz_notifier/fizz_buzz_notifier.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FizzBuzzView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<FizzBuzzNotifier>(
        builder: (BuildContext context, _, Widget? child) {
          return ListView.builder(
            itemCount: _.fizzBuzzIterable.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Center(
                    child: Text(
                      _.fizzBuzzIterable.elementAt(index),
                      style: TextStyle(
                          fontSize: Adaptive.sp(18),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
