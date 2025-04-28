import 'package:flutter/material.dart';

class RestoreForm extends StatefulWidget {
  final void Function(String email)? onSubmit;
  final VoidCallback? onCancel;

  const RestoreForm({
    super.key,
    this.onSubmit,
    this.onCancel,
  });

  @override
  State<RestoreForm> createState() => _RestoreFormState();
}

class _RestoreFormState extends State<RestoreForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        widget.onSubmit?.call(_emailController.text);
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
          const Text(
            'Восстановление пароля',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Введите email, указанный при регистрации, и мы отправим вам инструкции по восстановлению пароля',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
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
                  : const Text('Отправить'),
            ),
          ),
          if (widget.onCancel != null) ...[
            const SizedBox(height: 16),
            TextButton(
              onPressed: _isLoading ? null : widget.onCancel,
              child: const Text('Вернуться к входу'),
            ),
          ],
        ],
      ),
    );
  }
}
