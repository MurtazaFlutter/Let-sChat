import '../../../utils/exports.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  late AuthService service;
  late TextEditingController _emailController;
  late RoundedLoadingButtonController _loginBtnController;

  @override
  void initState() {
    service = AuthService();
    _emailController = TextEditingController();
    _loginBtnController = RoundedLoadingButtonController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<ValidatorNotifier>(
                builder: (context, validatorNotifier, child) {
              return Column(
                children: [
                  const Gap(50),
                  SizedBox(
                    height: 100,
                    child: Center(
                        child: Image.asset(
                      AppUtil().appIcon,
                      color: AppColor.primary,
                    )),
                  ),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Gap(30),
                  const Center(
                    child: Text(
                      'Please enter your email to reset password',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const Gap(50),
                  CommonTextField(
                    validator: FlutterError.onError,
                    alignment: Alignment.centerLeft,
                    controller: _emailController,
                    hintText: "email",
                    inputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (email) {
                      validatorNotifier.updateLoginEmail(email);
                    },
                  ),
                  validatorNotifier.forgotEmail.isNotEmpty
                      ? ErrorText(errorText: validatorNotifier.forgotEmail)
                      : Container(),
                  const Gap(20),
                  RoundedLoadingButton(
                    width: MediaQuery.of(context).size.width,
                    color: AppColor.primary,
                    controller: _loginBtnController,
                    onPressed: () {
                      service.forgotPassword(_emailController.text.trim());
                      const CustomDialogBox(
                        title: "Reset Password Link",
                        descriptions:
                            'An Email has been sent to you to reset your password',
                      );
                    },
                    child: const Text(
                      "Submit",
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
    );
  }

  // Future onPasswordReset() async {
  //   FocusScope.of(context).unfocus();
  //   if (!_validateForm(_emailController.text)) {
  //     return;
  //   }

  //   var res = await service.forgotPassword(
  //     _emailController.text,
  //   );
  //   if (res.) {
  //     _loginBtnController.success();
  //   }
  //   else {
  //     _loginBtnController.reset();
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const CustomDialogBox(
  //           title: "Login",
  //           //  descriptions: res.message,
  //         );
  //       },
  //     );
  //   }
  // }
}
