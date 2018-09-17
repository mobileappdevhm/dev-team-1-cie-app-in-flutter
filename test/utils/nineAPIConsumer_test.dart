import 'package:cie_app/utils/nineAPIConsumer.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 40))
void main() {
  test('test Internet connectivity', () {
    NineAPIEngine.isInternetConnected().then((isConnected) {
      (new Connectivity().checkConnectivity()).then((connectivityResult) {
        bool testLogic = (connectivityResult == ConnectivityResult.mobile ||
                connectivityResult == ConnectivityResult.wifi)
            ? true
            : false;
        expect(isConnected, testLogic);
      });
    });
  });
}
