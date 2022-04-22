import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:instagram_clone/core/app_colors.dart';
import 'package:instagram_clone/pages/singup_page/singup_page.dart';
import 'package:instagram_clone/services/authentication_service.dart';
import 'package:instagram_clone/utils/functions.dart';
import 'package:instagram_clone/widgets/custom_button.dart';
import 'package:instagram_clone/widgets/custom_text_field.dart';

import '../../core/app_images.dart';
import '../../core/app_mobile_layout.dart';
import '../../core/app_responsive_layout.dart';
import '../../core/app_web_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void changedLoagind() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void navigateToSignupPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const SignupPage(),
    ));
  }

  void loginUser() async {
    changedLoagind();
    String result = await AutheticationService().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (result == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const AppResponsiveLayout(
            mobileLayout: AppMobileLayout(), webLayout: AppWebLayout()),
      ));
    } else {
      showSnackBar(result, context);
    }
    changedLoagind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 1),
              SvgPicture.asset(
                imageLogo,
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              CustomTextField(
                  textEditingController: _emailController,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 24),
              CustomTextField(
                textEditingController: _passwordController,
                hintText: 'Password',
                textInputType: TextInputType.text,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              CustomButton(
                textButton: 'Login',
                isLoading: isLoading,
                onTap: loginUser,
              ),
              const SizedBox(height: 12),
              Flexible(child: Container(), flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      "Don't have an account? ",
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: navigateToSignupPage,
                    child: Container(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
