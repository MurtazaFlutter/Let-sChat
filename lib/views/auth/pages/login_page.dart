import '../../../utils/exports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthService service;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late RoundedLoadingButtonController _loginBtnController;

  @override
  void initState() {
    service = AuthService();
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
    final formPageKey = GlobalKey<FormState>();
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      floatingActionButton: Visibility(
          visible: !keyboardIsOpen,
          child: CustomFloatButton(
              title: 'Register',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  ))),
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
                      )),
                    ),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Gap(50),
                    CommonTextField(
                      validator: FlutterError.onError,
                      alignment: Alignment.centerLeft,
                      controller: _emailController,
                      hintText: "Email",
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: (email) {
                        validationProvider.updateLoginEmail(email);
                      },
                    ),
                    validationProvider.errorLoginEmail.isNotEmpty
                        ? ErrorText(
                            errorText: validationProvider.errorLoginEmail)
                        : Container(),
                    const Gap(10),
                    CommonTextField(
                      controller: _passwordController,
                      obsecureText: validationProvider.loginObsecureText,
                      hintText: "Password",
                      inputType: TextInputType.visiblePassword,
                      onChanged: (password) {
                        validationProvider.updatePassword(password);
                      },
                      onTap: () {},
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
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage())),
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
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
