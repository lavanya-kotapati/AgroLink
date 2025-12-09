import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_idea/Screens/home_page.dart';
import 'package:make_my_idea/Screens/login_page.dart';
import 'package:make_my_idea/bloc/wishlist_bloc/wishlist_bloc.dart';
import 'package:make_my_idea/constants/supabase_details.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  // Make sure plugin binding is initialized BEFORE using any plugins
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase (this internally uses shared_preferences for session storage)
  await Supabase.initialize(
    url: SupabaseDetails.baseurl,
    anonKey: SupabaseDetails.anonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return BlocProvider(
      create: (context) => WishlistBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            supabase.auth.currentSession == null
                ? const LoginPage()
                : const HomePage(),
      ),
    );
  }
}
