import 'package:make_my_idea/bloc/signup_bloc/signup_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginService {
  final SupabaseClient loginAuthService = Supabase.instance.client;
  Future<void> loginwithpassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await loginAuthService.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw Exception('Invalid email or password');
      }
    } on AuthException catch (e) {
      throw Exception(e);
    } catch (_) {
      throw Exception('Something went wrong. Please try again.');
    }
  }
}
