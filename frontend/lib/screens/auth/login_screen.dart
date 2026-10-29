import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers
  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Template functions
  void _onLoginPressed() {
    debugPrint('Login button pressed: ${_identifierController.text}');
    // Enterprise logic: Navigate directly to dashboard
    context.goNamed('dashboard');
  }

  void _onForgotPasswordPressed() {
    debugPrint('Forgot password pressed');
    // TODO: Implement forgot password logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              // Logo Placeholder
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    Icons.architecture,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Please enter your credentials to access the project management portal.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 48),

              // Form Fields
              CustomTextField(
                labelText: 'Email or Phone',
                hintText: 'Enter your email or phone',
                controller: _identifierController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                labelText: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off_outlined),
                  onPressed: () {
                    // TODO: Implement toggle password visibility
                  },
                ),
              ),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _onForgotPasswordPressed,
                  child: const Text('Forgot password?'),
                ),
              ),
              const SizedBox(height: 40),

              // Login Button
              CustomButton(text: 'Login', onPressed: _onLoginPressed),
              const SizedBox(height: 40),

              // Footer info
              Center(
                child: Text(
                  'Enterprise Solution v1.0',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
