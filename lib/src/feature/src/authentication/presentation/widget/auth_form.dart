import 'package:ui_kit/ui_kit.dart';
import '../../authentication.dart';

enum AuthType { login, register }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late final ValueNotifier<bool> _isVisible;
  late final ValueNotifier<AuthType> _authType;

  @override
  void initState() {
    super.initState();
    _isVisible = ValueNotifier<bool>(true);
    _authType = ValueNotifier<AuthType>(.login);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      children: [
        UiText.titleMedium('Email адрес', style: TextStyle(fontWeight: .w600)),
        const SizedBox(height: 8),
        UiTextField.standard(
          controller: _emailController,
          style: UiTextFieldStyle(
            hintText: 'example@mail.com',
            suffixIcon: IconButton(
              onPressed: () => _emailController.clear(),
              icon: const Icon(Icons.close),
            ),
          ),
        ),
        const SizedBox(height: 16),
        UiText.titleMedium('Пароль', style: TextStyle(fontWeight: .w600)),
        const SizedBox(height: 8),
        ValueListenableBuilder<bool>(
          valueListenable: _isVisible,
          builder: (_, value, _) => UiTextField.standard(
            obscureText: value,
            controller: _passwordController,
            style: UiTextFieldStyle(
              hintText: 'Пароль',
              suffixIcon: IconButton(
                onPressed: () => _isVisible.value = !_isVisible.value,
                icon: Icon(value ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
        ),

        ValueListenableBuilder<AuthType>(
          valueListenable: _authType,
          builder: (_, value, _) => switch (value) {
            .login => Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .stretch,
              mainAxisSize: .min,
              children: [
                const SizedBox(height: 12),
                const ForgotPasswordButton(),
                const SizedBox(height: 32),
                LoginButton(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ],
            ),
            .register => Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .stretch,
              mainAxisSize: .min,
              children: [
                const SizedBox(height: 58),
                RegisterButton(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ],
            ),
          },
        ),
        const SizedBox(height: 60),
        ValueListenableBuilder(
          valueListenable: _authType,
          builder: (context, value, child) {
            return HaveAccountButton(
              authType: value,
              onPressed: () => _authType.value == .login
                  ? _authType.value = .register
                  : _authType.value = .login,
            );
          },
        ),
      ],
    );
  }
}
