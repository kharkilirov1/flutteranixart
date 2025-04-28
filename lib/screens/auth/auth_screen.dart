import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import 'sign_in_form.dart';
import 'sign_up_form.dart';
import 'restore_form.dart';

enum AuthMode { signIn, signUp, restore }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode _mode = AuthMode.signIn;

  void _setMode(AuthMode mode) {
    setState(() {
      _mode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthService>(
          builder: (context, authService, child) {
            if (authService.error != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(authService.error!),
                    backgroundColor: Colors.red,
                  ),
                );
              });
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FlutterLogo(size: 80),
                      const SizedBox(height: 32),
                      if (_mode != AuthMode.restore)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => _setMode(AuthMode.signIn),
                              style: TextButton.styleFrom(
                                foregroundColor: _mode == AuthMode.signIn
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              child: const Text('Вход'),
                            ),
                            const SizedBox(width: 16),
                            TextButton(
                              onPressed: () => _setMode(AuthMode.signUp),
                              style: TextButton.styleFrom(
                                foregroundColor: _mode == AuthMode.signUp
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              child: const Text('Регистрация'),
                            ),
                          ],
                        ),
                      const SizedBox(height: 24),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: _buildCurrentForm(context),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCurrentForm(BuildContext context) {
    final authService = context.read<AuthService>();

    switch (_mode) {
      case AuthMode.signIn:
        return SignInForm(
          key: const ValueKey('signIn'),
          onSubmit: (email, password) async {
            if (await authService.signIn(email, password)) {
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/home');
              }
            }
          },
          onForgotPassword: () => _setMode(AuthMode.restore),
        );
      case AuthMode.signUp:
        return SignUpForm(
          key: const ValueKey('signUp'),
          onSubmit: (email, password) async {
            if (await authService.signUp(email, password)) {
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/home');
              }
            }
          },
          onGoogleSignUp: () {
            // TODO: Реализовать вход через Google
          },
          onVkSignUp: () {
            // TODO: Реализовать вход через VK
          },
        );
      case AuthMode.restore:
        return RestoreForm(
          key: const ValueKey('restore'),
          onSubmit: (email) async {
            if (await authService.resetPassword(email)) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Инструкции по восстановлению пароля отправлены на ваш email'),
                    backgroundColor: Colors.green,
                  ),
                );
                _setMode(AuthMode.signIn);
              }
            }
          },
          onCancel: () => _setMode(AuthMode.signIn),
        );
    }
  }
}
