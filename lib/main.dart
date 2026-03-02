import 'package:flutter/material.dart';
import 'auth/views/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hlhoefbrifruicjkqxvt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhsaG9lZmJyaWZydWljamtxeHZ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE0OTc4NjgsImV4cCI6MjA4NzA3Mzg2OH0.fNTzJM-UuVOJ_cd-ucjtG5HI0iTfLqeLXNhvCg84ibo',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
    );
  }
}
