import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/auth/register_page.dart';
import 'package:yearbook_app/screens/home_screen.dart';
import 'package:yearbook_app/utlis/colors.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

import '../../../widgets/textfield_widget.dart';
import '../../../widgets/toast_widget.dart';
import '../../utlis/app_constants.dart';
import '../../widgets/app_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: size.height * 0.24,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1E2E3D),
                      Color(0xff152534),
                      Color(0xff0C1C2E),
                    ],
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in to your\nAccount',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Sign in to your Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormField(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Please, Enter Email Address'
                            : AppConstants.emailRegex.hasMatch(value)
                                ? null
                                : 'Invalid Email Address';
                      },
                      controller: emailController,
                    ),
                    AppTextFormField(
                      labelText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Please, Enter Password'
                            : AppConstants.passwordRegex.hasMatch(value)
                                ? null
                                : 'Invalid Password';
                      },
                      controller: passwordController,
                      obscureText: isObscure,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(48, 48),
                            ),
                          ),
                          icon: Icon(
                            isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: ((context) {
                            final formKey = GlobalKey<FormState>();
                            final TextEditingController emailController =
                                TextEditingController();

                            return AlertDialog(
                              title: TextWidget(
                                text: 'Forgot Password',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              content: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFieldWidget(
                                      hint: 'Email',
                                      textCapitalization:
                                          TextCapitalization.none,
                                      inputType: TextInputType.emailAddress,
                                      label: 'Email',
                                      controller: emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter an email address';
                                        }
                                        final emailRegex = RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                        if (!emailRegex.hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: (() {
                                    Navigator.pop(context);
                                  }),
                                  child: TextWidget(
                                    text: 'Cancel',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                TextButton(
                                  onPressed: (() async {
                                    if (formKey.currentState!.validate()) {
                                      try {
                                        Navigator.pop(context);
                                        await FirebaseAuth.instance
                                            .sendPasswordResetEmail(
                                                email: emailController.text);
                                        showToast(
                                            'Password reset link sent to ${emailController.text}');
                                      } catch (e) {
                                        String errorMessage = '';

                                        if (e is FirebaseException) {
                                          switch (e.code) {
                                            case 'invalid-email':
                                              errorMessage =
                                                  'The email address is invalid.';
                                              break;
                                            case 'user-not-found':
                                              errorMessage =
                                                  'The user associated with the email address is not found.';
                                              break;
                                            default:
                                              errorMessage =
                                                  'An error occurred while resetting the password.';
                                          }
                                        } else {
                                          errorMessage =
                                              'An error occurred while resetting the password.';
                                        }

                                        showToast(errorMessage);
                                        Navigator.pop(context);
                                      }
                                    }
                                  }),
                                  child: TextWidget(
                                    text: 'Continue',
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          }),
                        );
                      },
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FilledButton(
                      onPressed: _formKey.currentState?.validate() ?? false
                          ? () {
                              login(context);
                            }
                          : null,
                      style: const ButtonStyle().copyWith(
                        backgroundColor: MaterialStateProperty.all(
                          _formKey.currentState?.validate() ?? false
                              ? null
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Divider(
                    //         color: Colors.grey.shade200,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 20,
                    //       ),
                    //       child: Text(
                    //         'Or login with',
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .bodySmall
                    //             ?.copyWith(color: Colors.black),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Divider(
                    //         color: Colors.grey.shade200,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: OutlinedButton.icon(
                    //         onPressed: () {},
                    //         style: Theme.of(context).outlinedButtonTheme.style,
                    //         icon: SvgPicture.asset(
                    //           Vectors.googleIcon,
                    //           width: 14,
                    //         ),
                    //         label: const Text(
                    //           'Google',
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     Expanded(
                    //       child: OutlinedButton.icon(
                    //         onPressed: () {},
                    //         style: Theme.of(context).outlinedButtonTheme.style,
                    //         icon: SvgPicture.asset(
                    //           Vectors.facebookIcon,
                    //           width: 14,
                    //         ),
                    //         label: const Text(
                    //           'Facebook',
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'Register',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: primary,
                              fontWeight: FontWeight.bold,
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
    );
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      showToast('Logged in succesfully!');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
