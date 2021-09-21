import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver;
  setUpAll(() async => driver = await FlutterDriver.connect());
  tearDownAll(() async => driver.close());

  testUsersRepository();
}

void testUsersRepository() {
  test('My first integration test that fails', () async {
    final firstNumber = 1;
    print('here');
    expect(firstNumber, 3);
  });
}
