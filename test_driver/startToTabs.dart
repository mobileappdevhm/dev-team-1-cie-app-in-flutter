import 'package:cie_team1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
// This line imports the extension


/*
Running integration tests

To run the test on an Android device, connect the device via USB to your computer and enable USB debugging. Then run the following command:

flutter drive --target=test_driver/startToTabs.dart

This command will:

build the --target app and install it on the device
launch the app
run the startToTabs_test.dart test located in my_app/test_driver/

You might be wondering how the command finds the correct test file. The flutter drive command uses a convention to look for the test file in the same directory as the instrumented --target app that has the same file name but for the _test suffix in it.
*/

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  runApp(new MyApp());
}
