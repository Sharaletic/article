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

  var _isNotVisible = true;
  AuthType _authType = AuthType.login;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UiText.titleMedium(
          'Email адрес',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          controller: _emailController,
          style: UiTextFieldStyle(
            hintText: 'example@mail.com',
            suffixIcon: IconButton(
              onPressed: () {
                _emailController.clear();
              },
              icon: Icon(Icons.close),
            ),
          ),
        ),
        const SizedBox(height: 16),
        UiText.titleMedium(
          'Пароль',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          obscureText: _isNotVisible,
          controller: _passwordController,
          style: UiTextFieldStyle(
            hintText: 'Пароль',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isNotVisible = !_isNotVisible;
                });
              },
              icon: Icon(
                _isNotVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ),
        if (_authType == AuthType.login) ...[
          const SizedBox(height: 8),
          const ForgotPasswordButton(),
          const SizedBox(height: 32),
          LoginButton(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
        ],
        if (_authType == AuthType.register) ...[
          const SizedBox(height: 54),
          RegisterButton(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
        ],
        const SizedBox(height: 60),
        HaveAccountButton(
          authType: _authType,
          onPressed: () => setState(() {
            _authType = _authType == AuthType.login
                ? AuthType.register
                : AuthType.login;
          }),
        ),
      ],
    );
  }
}
