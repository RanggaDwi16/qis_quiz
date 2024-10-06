import 'package:qis_quiz/core/provider/shared_preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'token_manager_provider.g.dart';

@riverpod
FutureOr<TokenManager> tokenManager(TokenManagerRef ref) async {
  final sharedPreferences = await ref.watch(sharedPreferenceProvider.future);
  return TokenManager(
    sharedPreferences: sharedPreferences,
  );
}

class TokenManager {
  final SharedPreferences sharedPreferences;

  TokenManager({required this.sharedPreferences});

  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('access_token', token);
  }

  Future<void> saveRole(String role) async {
    await sharedPreferences.setString('role', role);
  }

  //save status
  Future<void> saveStatus(bool status) async {
    await sharedPreferences.setBool('status_profile_completion', status);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString('access_token');
  }

  //get role
  Future<String?> getRole() async {
    return sharedPreferences.getString('role');
  }

  //get status
  Future<bool?> getStatus() async {
    return sharedPreferences.getBool('status_profile_completion');
  }

  Future<void> removeToken() async {
    await sharedPreferences.remove('access_token');
  }

  Future<void> removeRole() async {
    await sharedPreferences.remove('role');
  }

  Future<void> removeStatus() async {
    await sharedPreferences.remove('status_profile_completion');
  }

  Future<bool> isLogin() async {
    final token = await getToken();
    final role = await getRole();
    if (token != null && role != null) {
      return true;
    } else {
      return false;
    }
  }
}
