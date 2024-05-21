import 'package:get/get.dart';

import '../../view/screen/auth/signin.dart';
import '../../view/screen/auth/signup.dart';

abstract class BordingScreen extends GetxController{
  gotosignin();
  gotosignup();
}
class BordingcontrollernImp extends BordingScreen{
  @override
  gotosignin() {
    Get.to(SignIn(),transition: Transition.zoom,duration: Duration(milliseconds: 1000));
  }

  @override
  gotosignup() {
    Get.to(SignUp(),transition: Transition.zoom,duration: Duration(milliseconds: 1000));

  }

}