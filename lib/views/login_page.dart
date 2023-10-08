import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lets_chat/themes/colors.dart';
import 'package:lets_chat/widgets/custom_float_button.dart';
import 'package:lets_chat/widgets/custom_text_field.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidePwd = true;
  //late AuthService service;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late RoundedLoadingButtonController _loginBtnController;

  @override
  void initState() {
    //  service = AuthService(FirebaseAuth.instance);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _loginBtnController = RoundedLoadingButtonController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      floatingActionButton: Visibility(
          visible: !keyboardIsOpen, child: const CustomFloatButton()),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Center(
                          child: Image.asset(
                        'assets/icons/chat.png',
                        color: AppColor.primary,
                      )),
                    ),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Gap(50),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      leadingIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                    ),
                    const Gap(10),
                    CustomTextField(
                      obscureText: _isHidePwd,
                      controller: _passwordController,
                      hintText: 'Password',
                      leadingIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isHidePwd = !_isHidePwd;
                          });
                        },
                        icon: Icon(
                          _isHidePwd
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 10,
                    ),
                    const Gap(10),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: null,
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        )),
                    const Gap(20),
                    RoundedLoadingButton(
                      width: MediaQuery.of(context).size.width,
                      color: AppColor.primary,
                      controller: _loginBtnController,
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
