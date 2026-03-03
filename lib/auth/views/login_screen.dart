import 'package:flutter/material.dart';
import 'package:ghana_tourism_app/auth/repositories/auth_repository.dart';
import 'package:ghana_tourism_app/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(
        authRepository: AuthRepository(),
      ),
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          // Listen for state changes
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (viewModel.isSuccess) {
              _showMessage(context, 'Login successful!');
              // Navigate to home screen or dashboard
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
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
                    Color(0xFF006B5F),
                    Color(0xFFFCF116),
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

                    const SizedBox(height: 20),

                    const Text(
                      "Explore Ghana",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 40),

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

                    const SizedBox(height: 30),

                    // Forgot Password? (Optional)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          _showMessage(context, 'Forgot password tapped');
                          // Implement forgot password functionality
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Login Button
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
                            : () => viewModel.login(),
                        child: viewModel.isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFCE1126), width: 2),
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
        backgroundColor: message.contains('successful')
            ? Colors.green
            : Colors.red,
      ),
    );
  }
}