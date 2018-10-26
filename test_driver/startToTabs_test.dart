// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// there is an instruction for starting this test in startToTabs.dart

void main() {
  group('pressing startbutton test', () {
    FlutterDriver driver;

    setUpAll(() async {
      // Connects to the app
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        // Closes the connection
        driver.close();
      }
    });

    test('press Button', () async {
      // Record the performance timeline of things that happen inside the closure
      final Timeline timeline = await driver.traceAction(() async {
        // Find the scrollable user list
        final SerializableFinder button = find.text('Start');

        await driver.tap(button); //testing button press.

        final SerializableFinder button2 = find.text('Login');

        await driver.tap(button2); //testing button press.
      });

      // The `timeline` object contains all the performance data recorded during
      // the scrolling session. It can be digested into a handful of useful
      // aggregate numbers, such as "average frame build time".
      TimelineSummary summary = new TimelineSummary.summarize(timeline);

      // The following line saves the timeline summary to a JSON file.
      summary.writeSummaryToFile('startToLogin_performance', pretty: true);

      // The following line saves the raw timeline data as JSON.
      summary.writeTimelineToFile('startToLogin_performance', pretty: true);
    });
  });
}
