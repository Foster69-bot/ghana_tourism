import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final supabase = Supabase.instance.client;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;

  Future<void> signUpUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final username = usernameController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        username.isEmpty ||
        confirmPassword.isEmpty) {
      showMessage("Please fill all fields");
      return;
    }

    if (password != confirmPassword) {
      showMessage("Passwords do not match");
      return;
    }

    try {
      setState(() => isLoading = true);

      // Step 1: Sign up user
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = res.user;

      if (user != null) {
        // Step 2: Insert username into profiles table
        await supabase.from('users').insert({
          'id': user.id,
          'username': username,
        });

        showMessage("Signup successful!");
        Navigator.pop(context);
      }
    } on AuthException catch (e) {
      showMessage(e.message);
    } catch (e) {
      print("-------------");
      print(e);
      showMessage(e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF005F6B),
              Color(0xFFFFD816),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),

              const SizedBox(height: 16),

              const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              // Username
              TextField(
                controller: usernameController,
                decoration: inputDecoration("Username", Icons.person),
              ),

              const SizedBox(height: 20),

              // Email
              TextField(
                controller: emailController,
                decoration: inputDecoration("Email", Icons.email),
              ),

              const SizedBox(height: 20),

              // Password
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: inputDecoration("Password", Icons.lock),
              ),

              const SizedBox(height: 20),

              // Confirm Password
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: inputDecoration("Confirm Password", Icons.lock),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCE1126),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: isLoading ? null : signUpUser,
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    "Sign up",
                    style:
                    TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
