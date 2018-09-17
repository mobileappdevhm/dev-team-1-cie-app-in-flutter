import 'package:cie_app/model/user/currentUser.dart';
import 'package:cie_app/model/user/currentUser_mock.dart';
import 'package:cie_app/model/user/currentUser_prod.dart';
import 'package:cie_app/utils/staticVariables.dart';

//DI
class UserInjector {
  static final UserInjector _singleton = new UserInjector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory UserInjector() {
    return _singleton;
  }

  UserInjector._internal();

  CurrentUser get currentUser {
    switch (_flavor) {
      case Flavor.MOCK:
        return new CurrentUserMock();
      default:
        return new CurrentUserProd();
    }
  }
}
