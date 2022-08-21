import 'package:flutter_test/flutter_test.dart';
import 'package:huubap_task/notifiers/fizz_buzz_notifier/fizz_buzz_notifier.dart';

void main() {
  test("Testing Fizz Buzz", () {
    FizzBuzzNotifier fizzBuzzNotifier = FizzBuzzNotifier();

    expect(fizzBuzzNotifier.testFizzBuzz(number: 3), "Fizz");
    expect(fizzBuzzNotifier.testFizzBuzz(number: 5), "Buzz");
    expect(fizzBuzzNotifier.testFizzBuzz(number: 15), "FizzBuzz");
  });
}
