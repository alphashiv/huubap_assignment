import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FizzBuzzNotifier extends ChangeNotifier {
  FizzBuzzNotifier() {
    setFizzBuzzGenerator = 1000;
  }

  late Iterable<String> fizzBuzzIterable;
  Iterable<String> _generateFizzBuzz({required int maxCount}) sync* {
    for (int i = 1; i <= maxCount; i++) {
      if (i % 15 == 0)
        yield "FizzBuzz";
      else if (i % 3 == 0)
        yield "Fizz";
      else if (i % 5 == 0)
        yield "Buzz";
      else
        yield i.toString();
    }

    /// Optimised Solution
    // for (int i = 1; i < maxCount; i++) {
    //   String s = "";

    //   if (i % 3 == 0) s += "Fizz";
    //   if (i % 5 == 0) s += "Buzz";
    //   if (s == "") {
    //     yield i.toString();
    //   } else {
    //     yield s;
    //   }
    // }
  }

  set setFizzBuzzGenerator(int number) {
    fizzBuzzIterable = _generateFizzBuzz(maxCount: number);
    notifyListeners();
  }

  String testFizzBuzz({required int number}) {
    if (number % 15 == 0)
      return "FizzBuzz";
    else if (number % 3 == 0)
      return "Fizz";
    else if (number % 5 == 0)
      return "Buzz";
    else
      return number.toString();
  }
}
