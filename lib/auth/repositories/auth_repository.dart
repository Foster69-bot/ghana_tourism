import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository({SupabaseClient? supabase})
      : _supabase = supabase ?? Supabase.instance.client;

  // Sign up new user
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // Sign up with Supabase Auth
      final AuthResponse res = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = res.user;
      if (user == null) {
        throw Exception('Failed to create user');
      }

      // Create user profile in users table
      await _supabase.from('users').insert({
        'id': user.id,
        'username': username,
        'email': email,
        'created_at': DateTime.now().toIso8601String(),
      });

      return UserModel(
        id: user.id,
        username: username,
        email: email,
        createdAt: DateTime.now(),
      );
    } on AuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  // Sign in existing user
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = res.user;
      if (user == null) {
        throw Exception('Failed to sign in');
      }

      // Fetch user profile
      final profileResponse = await _supabase
          .from('users')
          .select()
          .eq('id', user.id)
          .single();

      return UserModel.fromJson(profileResponse);
    } on AuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('An unexpected error occurred: ${e.toString()}');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Get current user
  User? get currentUser => _supabase.auth.currentUser;

  // Check if user is logged in
  bool get isLoggedIn => _supabase.auth.currentUser != null;

  // Auth state stream
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  // Handle Auth exceptions
  Exception _handleAuthException(AuthException e) {
    switch (e.message) {
      case 'Invalid login credentials':
        return Exception('Invalid email or password');
      case 'Email not confirmed':
        return Exception('Please verify your email address');
      case 'User already registered':
        return Exception('This email is already registered');
      case 'Email rate limit exceeded':
        return Exception('Too many attempts. Please try again later.');
      default:
        return Exception(e.message);
    }
  }
}