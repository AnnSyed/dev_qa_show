import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Registration test', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    //Write Successful test
    //Successful
    test('SucessFul Case', () async{
      await driver.tap(find.byValueKey('mySignUpButton'));
      await driver.tap(find.byValueKey('myUsername'));
      await driver.waitFor(find.text(''));
      await driver.enterText('Anum');
      await driver.tap(find.byValueKey('myPhoneNumber'));
      await driver.waitFor(find.text(''));
      await driver.enterText('032218484848');
      await driver.tap(find.byValueKey('mySwitch'));
      await driver.tap(find.byValueKey('mySubmitButton'));
      await driver.waitFor(find.text('Success'));
      await driver.tap(find.byValueKey('myOkayButton'));
    });



    test('Negative Test Case', () async{
      await driver.tap(find.byValueKey('mySignUpButton'));
      await driver.tap(find.byValueKey('mySubmitButton'));
      await driver.waitFor(find.text('Username required'));
    } );

    test('Toggle Negative Case', () async{

      await driver.tap(find.byValueKey('myUsername'));
     // await driver.waitFor(find.text(''));
      await driver.enterText('Anum');
      await driver.tap(find.byValueKey('myPhoneNumber'));
      //await driver.waitFor(find.text(''));
      await driver.enterText('0342554454');
      await driver.tap(find.byValueKey('mySubmitButton'));
      await driver.waitFor(find.text('Please agree to T&C'));

    } );
    // Test scripts





  });
}
