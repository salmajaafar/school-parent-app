
import 'package:get/get.dart';


class VerifyController extends GetxController {
  var isLoading = false.obs;
  var verificationMessage = ''.obs;

  Future<void> verifyCode(String code, String email) async {
    isLoading.value = true;

   // final response = await VerifyServices.verifyCode(code, email);

    // if (response != null && response.success) {
    //   verificationMessage.value = response.message;
    //   //Get.off(() => ChangePasssowrd(email: email));

    // } else {
    //   verificationMessage.value = 'Failed to verify code';
    //   Get.snackbar('Error', verificationMessage.value);
    // }

    isLoading.value = false;
  }
}


