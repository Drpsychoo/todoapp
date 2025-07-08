import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:texastodo/feature/home/home.dart';
import 'package:texastodo/feature/login/login_screen.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  // ✅ Loading and error handling
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => Homepage());
    }
  }

  // ✅ Register user
  Future<void> register(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(() => Homepage());
      Get.snackbar("Success", "Account created successfully!");
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? "Registration failed";
      Get.snackbar("Error", errorMessage.value);
    } catch (e) {
      errorMessage.value = "Unexpected error occurred.";
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Login user
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Logged in successfully!");
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? "Login failed";
      Get.snackbar("Error", errorMessage.value);
    } catch (e) {
      errorMessage.value = "Unexpected error occurred.";
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Logout user
  void logout() async {
    await auth.signOut();
    Get.snackbar("Logged out", "You have been logged out.");
  }
}
