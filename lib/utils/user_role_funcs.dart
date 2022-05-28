import 'package:get_storage/get_storage.dart';

class UserRoleFuncs {
  static void setUserAsStandartUser() {
    GetStorage().write('role', 'standart_user');
  }

  static void setUserAsPharmacy() {
    GetStorage().write('role', 'pharmacy');
  }

  static void setUserAsKBBEmployee() {
    GetStorage().write('role', 'kbb');
  }

  static UserRoles getUserRole() {
    var role = GetStorage().read('role');
    switch (role) {
      case 'standart_user':
        return UserRoles.USER;
      case 'pharmacy':
        return UserRoles.PHARMACY;
      case 'kbb':
        return UserRoles.KBB;
      default:
        return UserRoles.UNKNOWN;
    }
  }
}

enum UserRoles { USER, PHARMACY, KBB, UNKNOWN }
