import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final void Function(String email, String password)? onSubmit;
  final VoidCallback? onGoogleSignUp;
  final VoidCallback? onVkSignUp;

  const SignUpForm({
    super.key,
    this.onSubmit,
    this.onGoogleSignUp,
    this.onVkSignUp,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        if (widget.onSubmit != null) {
          widget.onSubmit!(
            _emailController.text,
            _passwordController.text,
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            enabled: !_isLoading,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите email';
              }
              if (!value.contains('@')) {
                return 'Введите корректный email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Пароль',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            enabled: !_isLoading,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите пароль';
              }
              if (value.length < 6) {
                return 'Пароль должен быть не менее 6 символов';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: const InputDecoration(
              labelText: 'Подтвердите пароль',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock_outline),
            ),
            obscureText: true,
            enabled: !_isLoading,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, подтвердите пароль';
              }
              if (value != _passwordController.text) {
                return 'Пароли не совпадают';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _submit,
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Зарегистрироваться'),
            ),
          ),
          const SizedBox(height: 24),
          const Text('или'),
          const SizedBox(height: 24),
          if (widget.onGoogleSignUp != null)
            OutlinedButton.icon(
              onPressed: _isLoading ? null : widget.onGoogleSignUp,
              icon: Image.asset(
                'assets/images/google_logo.png',
                height: 24,
              ),
              label: const Text('Войти через Google'),
            ),
          if (widget.onVkSignUp != null) ...[
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _isLoading ? null : widget.onVkSignUp,
              icon: Image.asset(
                'assets/images/vk_logo.png',
                height: 24,
              ),
              label: const Text('Войти через VK'),
            ),
          ],
        ],
      ),
    );
  }
}
