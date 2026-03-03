import 'package:flutter/material.dart';
import '../repositories/auth_repository.dart';
import '../models/user_model.dart';

enum ViewState { idle, loading, success, error }

class LoginViewModel extends ChangeNotifier {
   final AuthRepository authRepository;
   LoginViewModel({required this.authRepository});

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // State
  ViewState _state = ViewState.idle;
  String? _errorMessage;
  UserModel? _currentUser;

  // Getters
  ViewState get state => _state;
  String? get errorMessage => _errorMessage;
  UserModel? get currentUser => _currentUser;
  bool get isLoading => _state == ViewState.loading;
  bool get isSuccess => _state == ViewState.success;
  bool get hasError => _state == ViewState.error;

  // Validation methods
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Login method
  Future<bool> login() async {
    // Validate fields
    final emailError = validateEmail(emailController.text);
    final passwordError = validatePassword(passwordController.text);

    if (emailError != null || passwordError != null) {
      _errorMessage = emailError ?? passwordError;
      _state = ViewState.error;
      notifyListeners();
      return false;
    }

    _state = ViewState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await authRepository.signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      _currentUser = user;
      _state = ViewState.success;
      notifyListeners();

      // Clear controllers on success
      clearControllers();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _state = ViewState.error;
      notifyListeners();
      return false;
    }
  }

  // Clear controllers
  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  // Reset state
  void resetState() {
    _state = ViewState.idle;
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}