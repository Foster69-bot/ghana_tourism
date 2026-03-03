import 'package:flutter/material.dart';
import '../repositories/auth_repository.dart';
import '../models/user_model.dart';

enum ViewState { idle, loading, success, error }

class SignupViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  // Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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

  SignupViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;

  // Validation methods
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Sign up method
  Future<bool> signUp() async {
    // Validate all fields
    final usernameError = validateUsername(usernameController.text);
    final emailError = validateEmail(emailController.text);
    final passwordError = validatePassword(passwordController.text);
    final confirmError = validateConfirmPassword(confirmPasswordController.text);

    if (usernameError != null ||
        emailError != null ||
        passwordError != null ||
        confirmError != null) {
      _errorMessage = usernameError ?? emailError ?? passwordError ?? confirmError;
      _state = ViewState.error;
      notifyListeners();
      return false;
    }

    _state = ViewState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = await _authRepository.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        username: usernameController.text.trim(),
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

  // Clear all controllers
  void clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  // Reset state
  void resetState() {
    _state = ViewState.idle;
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}