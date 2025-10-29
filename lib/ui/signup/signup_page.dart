import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/utils/extensions/async_value_ui.dart';
import 'package:supa_task/core/widgets/loading/loading_widget.dart';
import 'package:supa_task/core/widgets/oauth_section.dart';
import 'package:supa_task/core/widgets/text_fields/email_field.dart';
import 'package:supa_task/core/widgets/text_fields/password_field.dart';
import 'package:supa_task/domain/repository/user/command/signup_command.dart';
import 'package:supa_task/ui/signup/viewmodel/signup_viewmodel.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<ShadFormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final vm = ref.read(signupViewmodelProvider.notifier);
    final isPasswordVisible = ref.watch(
      signupViewmodelProvider.select((uiState) => uiState.isPasswordVisible),
    );

    ref.listen(
      signupCommandProvider,
      (_, next) => next.showToastOnError(context, title: 'Signup Failed'),
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
                            const Icon(
                              Icons.person_add_alt_1_rounded,
                              size: 48,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Create an account",
                              style: theme.textTheme.h4,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Join and manage your tasks easily",
                              style: theme.textTheme.muted,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      ShadInputFormField(
                        controller: _nameController,
                        label: Text("Full Name"),
                        textInputAction: TextInputAction.next,

                        placeholder: const Text("John Doe"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

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

                      ShadButton(
                        width: double.infinity,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await vm.signup(
                              _emailController.text,
                              _passwordController.text,
                              _nameController.text,
                            );
                          }
                        },
                        child: ref
                            .watch(signupCommandProvider)
                            .maybeWhen(
                              loading: () => LoadingWidget(),
                              orElse: () => const Text("Sign up"),
                            ),
                      ),

                      const SizedBox(height: 16),
                      OAuthSection(),
                      const SizedBox(height: 24),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            GestureDetector(
                              onTap: () => context.go('/login'),
                              child: Text(
                                "Log in",
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
