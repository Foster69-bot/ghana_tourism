import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/signup_viewmodel.dart';
import '../repositories/auth_repository.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupViewModel(
        authRepository: AuthRepository(),
      ),
      child: Consumer<SignupViewModel>(
        builder: (context, viewModel, child) {
          // Listen for state changes
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (viewModel.isSuccess) {
              _showMessage(context, 'Signup successful!');

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );

              // Navigator.pop(context);
              viewModel.resetState();
            } else if (viewModel.hasError) {
              _showMessage(context, viewModel.errorMessage!);
              viewModel.resetState();
            }
          });

          return Scaffold(
            body: Container(
              height: double.infinity,
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

                    // Logo
                    Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(
                            width: 200,
                            height: 200,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image_not_supported, size: 50),
                          ),
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

                    // Username Field
                    _buildTextField(
                      controller: viewModel.usernameController,
                      hint: "Username",
                      icon: Icons.person,
                      validator: viewModel.validateUsername,
                    ),

                    const SizedBox(height: 20),

                    // Email Field
                    _buildTextField(
                      controller: viewModel.emailController,
                      hint: "Email",
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: viewModel.validateEmail,
                    ),

                    const SizedBox(height: 20),

                    // Password Field
                    _buildTextField(
                      controller: viewModel.passwordController,
                      hint: "Password",
                      icon: Icons.lock,
                      obscureText: true,
                      validator: viewModel.validatePassword,
                    ),

                    const SizedBox(height: 20),

                    // Confirm Password Field
                    _buildTextField(
                      controller: viewModel.confirmPasswordController,
                      hint: "Confirm Password",
                      icon: Icons.lock,
                      obscureText: true,
                      validator: viewModel.validateConfirmPassword,
                    ),

                    const SizedBox(height: 30),

                    // Sign Up Button
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
                        onPressed: viewModel.isLoading
                            ? null
                            : () => viewModel.signUp(),
                        child: viewModel.isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                          "Sign up",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Login Link
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
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
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: Colors.redAccent),
      ),
      validator: validator,
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}