import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  final String email;
  final bool isRestore;
  final VoidCallback? onVerified;
  final VoidCallback? onResendCode;

  const VerifyScreen({
    super.key,
    required this.email,
    this.isRestore = false,
    this.onVerified,
    this.onResendCode,
  });

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isRestore ? 'Восстановление пароля' : 'Подтверждение',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'На ${widget.email} отправлен код подтверждения',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _codeController,
                  decoration: const InputDecoration(
                    labelText: 'Введите код',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите код';
                    }
                    if (value.length < 6) {
                      return 'Код должен состоять из 6 цифр';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      widget.onVerified?.call();
                    }
                  },
                  child: const Text('Подтвердить'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: widget.onResendCode,
                  child: const Text('Отправить код повторно'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
