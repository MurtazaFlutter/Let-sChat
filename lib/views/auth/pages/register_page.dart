import '../../../utils/exports.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final bool _isHidePwd = true;
  late AuthService service;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;
  late RoundedLoadingButtonController _registerBtnController;

  @override
  void initState() {
    service = AuthService();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _registerBtnController = RoundedLoadingButtonController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formPageKey = GlobalKey<FormState>();
    // void signUp() async {
    //   try {
    //     service.registerUser(
    //         username: _usernameController.text,
    //         email: _emailController.text.trim(),
    //         password: _passwordController.text.trim());
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => MainScreen()));
    //   } catch (e) {
    //     print("error $e");
    //   }
    // }

    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      floatingActionButton: Visibility(
          visible: !keyboardIsOpen,
          child: CustomFloatButton(
            title: 'Login',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            ),
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formPageKey,
              child: Consumer<ValidatorNotifier>(
                  builder: (context, validationProvider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Center(
                          child: Image.asset(
                        AppUtil().appIcon,
                        color: AppColor.primary,
                      )),
                    ),
                    const Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Gap(50),
                    CommonTextField(
                      alignment: Alignment.centerLeft,
                      onChanged: (username) {
                        validationProvider.updateUsername(username);
                      },
                      onTap: () {},
                      hintText: "username",
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {},
                    ),
                    validationProvider.errorUsername.isNotEmpty
                        ? ErrorText(errorText: validationProvider.errorUsername)
                        : Container(),
                    const Gap(10),
                    CommonTextField(
                      alignment: Alignment.centerLeft,
                      controller: _emailController,
                      hintText: "email",
                      inputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      // onEditingComplete: () {
                      //   FocusScope.of(context).requestFocus(passwordFocusNode);
                      // },
                      onChanged: (email) {
                        validationProvider.updateSignUpEmail(email);
                      },
                    ),
                    validationProvider.errorSignupEmail.isNotEmpty
                        ? ErrorText(
                            errorText: validationProvider.errorSignupEmail)
                        : Container(),
                    const Gap(10),
                    CommonTextField(
                      obsecureText: validationProvider.obscurePasswordText1,
                      hintText: "password",
                      inputType: TextInputType.visiblePassword,
                      onChanged: (password) {
                        validationProvider.updatePassword(password);
                      },
                      onTap: () =>
                          validationProvider.togglePasswordVisibility1(),
                      alignment: Alignment.centerLeft,
                      iconSuffix: validationProvider.loginObsecureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onSuffixTap: () {
                        validationProvider.loginPasswordVisibility();
                      },
                      textInputAction: TextInputAction.done,
                    ),
                    validationProvider.errorPass.isNotEmpty
                        ? ErrorText(errorText: validationProvider.errorPass)
                        : Container(),
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
                      controller: _registerBtnController,
                      onPressed: () {},
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

//   bool _validateForm(String username, String email, String pwd) {
//     if (email.isEmpty || pwd.isEmpty) {
//       _registerBtnController.reset();
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return const CustomDialogBox(
//             descriptions: "Please enter your email and password.",
//           );
//         },
//       );
//       return false;
//     }
//     return true;
//   }

//   Future onRegister() async {
//     FocusScope.of(context).unfocus();
//     if (!_validateForm(_usernameController.text, _emailController.text,
//         _passwordController.text)) {
//       return;
//     }
//     var res = await service.registerUser(
//       username: _usernameController.text,
//       email: _emailController.text.trim(),
//       password: _passwordController.text.trim(),
//     );
//     if (res.status) {
//       _registerBtnController.success();
//     } else {
//       _registerBtnController.reset();
//       // ignore: use_build_context_synchronously
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return const CustomDialogBox(
//             descriptions: "Please enter your email and password.",
//           );
//         },
//       );
//     }
//   }
}
