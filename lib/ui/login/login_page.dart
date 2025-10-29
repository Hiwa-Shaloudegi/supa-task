import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/utils/extensions/async_value_ui.dart';
import 'package:supa_task/core/widgets/loading/loading_widget.dart';
import 'package:supa_task/core/widgets/logo_widget.dart';
import 'package:supa_task/core/widgets/oauth_section.dart';
import 'package:supa_task/core/widgets/text_fields/email_field.dart';
import 'package:supa_task/core/widgets/text_fields/password_field.dart';
import 'package:supa_task/domain/repository/user/command/login_command.dart';
import 'package:supa_task/ui/login/viewmodel/login_viewmodel.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<ShadFormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final vm = ref.read(loginViewModelProvider.notifier);
    final isPasswordVisible = ref.watch(
      loginViewModelProvider.select((uiState) => uiState.isPasswordVisible),
    );

    ref.listen(
      loginCommandProvider,
      (_, next) => next.showToastOnError(context, title: 'Login Failed'),
    );

    return Scaffold(
      body: ShadForm(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ShadCard(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            LogoWidget(),
                            const SizedBox(height: 12),
                            Text("Welcome back", style: theme.textTheme.h4),
                            const SizedBox(height: 4),
                            Text(
                              "Log in to continue",
                              style: theme.textTheme.muted,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      ShadEmailField(controller: _emailController),
                      const SizedBox(height: 16),

                      ShadPasswordField(
                        controller: _passwordController,

                        isPasswordVisible: isPasswordVisible,
                        onToggleVisibility: () {
                          vm.togglePasswordVisibility();
                        },
                      ),

                      const SizedBox(height: 24),

                      // Login button
                      ShadButton(
                        width: double.infinity,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await vm.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: ref
                            .watch(loginCommandProvider)
                            .maybeWhen(
                              loading: () => LoadingWidget(),
                              orElse: () => const Text("Log in"),
                            ),
                      ),
                      const SizedBox(height: 16),

                      // TODO: Forgot password
                      // Center(
                      //   child: TextButton(
                      //     onPressed: () {},
                      //     child: const Text("Forgot password?"),
                      //   ),
                      // ),
                      const SizedBox(height: 16),
                      OAuthSection(),
                      const SizedBox(height: 24),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () => context.go('/signup'),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
