
import 'package:get/get.dart';
import 'package:parent_app/routes/routes.dart';

class VerifyController extends GetxController {
  var isLoading = false.obs;
  var verificationMessage = ''.obs;

  Future<void> verifyCode(String code, String email) async {
    isLoading.value = true;

   // final response = await VerifyServices.verifyCode(code, email);

    // if (response != null && response.success) {
    //   verificationMessage.value = response.message;
    //   //Get.off(() => ChangePasssowrd(email: email));
     Get.offAllNamed(AppRoutes.main);
    // } else {
    //   verificationMessage.value = 'Failed to verify code';
    //   Get.snackbar('Error', verificationMessage.value);
    // }

    isLoading.value = false;
  }
}


