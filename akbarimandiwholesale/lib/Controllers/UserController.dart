import 'package:akbarimandiwholesale/Models/UserModel.dart';
import 'package:akbarimandiwholesale/Services/DataServices.dart';
import 'package:akbarimandiwholesale/utils/GlobalVariables.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rxn<List<UserModel>> userModel = Rxn<List<UserModel>>();

  UserModel? get userGetter => userModel.value?.first;

  @override
  void onInit() {
    print('userController initilized:::::::::::');
    if (isSigned.value!) {
      userModel.bindStream(Database().userStreamm(userID.value!));
    } else {}
    super.onInit();
  }

  set userSetter(UserModel value) {
    userModel.value?.first = value;
  }

  void clear() {
    userModel.value?.first = UserModel();
  }
}
