// import 'dart:convert';
// import 'package:bimbingan_online_mobile_android/core/domain/entites/login_model.dart';
// import 'package:bimbingan_online_mobile_android/core/provider/shared_preference_provider.dart';
// import 'package:qis_quiz/core/provider/shared_preference_provider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'user_manager_provider.g.dart';

// @Riverpod(keepAlive: true)
// FutureOr<UserManager> userManager(UserManagerRef ref) async {
//   final sharedPreferences = await ref.watch(sharedPreferenceProvider.future);
//   return UserManager(sharedPreferences: sharedPreferences);
// }

// @riverpod
// FutureOr<LoginModel?> getCurrentStatus(GetCurrentStatusRef ref) async {
//   final userManager = await ref.watch(userManagerProvider.future);
//   // Get the status from SharedPreferences
//   final user = await userManager.getStatus();
//   if (user != null) {
//     return user;
//   } else {
//     return const LoginModel(statusProfileCompletion: false);
//   }
// }

// class UserManager {
//   final SharedPreferences sharedPreferences;

//   UserManager({required this.sharedPreferences});

//   // Save the user's profile status completion in SharedPreferences
//   Future<void> saveStatus(LoginModel user) async {
//     final userJson = jsonEncode(user.toJson());
//     await sharedPreferences.setString('user_data', userJson);
//     print('User saved: ${user.toJson()}');
//   }

//   // Retrieve the status from SharedPreferences
//   Future<LoginModel?> getStatus() async {
//     final userString = sharedPreferences.getString('user_data');
//     if (userString != null) {
//       final userJson = jsonDecode(userString);
//       return LoginModel.fromJson(userJson);
//     } else {
//       print('No user data found');
//       return null;
//     }
//   }

//   Future<void> removeUser() async {
//     await sharedPreferences.remove('user_data');
//   }

//   Future<bool> hasStatus() async {
//     final user = await getStatus();
//     return user?.statusProfileCompletion ?? false;
//   }
// }
