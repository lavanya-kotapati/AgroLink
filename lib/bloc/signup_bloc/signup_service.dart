import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient _client = Supabase.instance.client;
  Future<void> Signup({required String email, required password}) async {
    final response = await _client.auth.signUp(
      password: password,
      email: email,
    );
    if (response.user == null) {
      throw Exception("SignUp Failed");
    }
  }
}
