import 'package:lets_chat/utils/app_util.dart';

import '../../../utils/exports.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  //late AuthService service;
  late TextEditingController _emailController;
  late RoundedLoadingButtonController _loginBtnController;

  @override
  void initState() {
    //  service = AuthService(FirebaseAuth.instance);
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const Gap(20),
              RoundedLoadingButton(
                width: MediaQuery.of(context).size.width,
                color: AppColor.primary,
                controller: _loginBtnController,
                onPressed: onLogin,
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm(
    String email,
  ) {
    if (email.isEmpty) {
      _loginBtnController.reset();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialogBox(
            descriptions: "Please enter your email.",
          );
        },
      );
      return false;
    }
    return true;
  }

  Future onLogin() async {
    FocusScope.of(context).unfocus();
    if (!_validateForm(_emailController.text)) {
      return;
    }

    // var res = await service.signInWithEmailPassword(
    //   _emailController.text,
    //   _passwordController.text,
    // );
    // if (res.status) {
    //   _loginBtnController.success();
    // }
    else {
      _loginBtnController.reset();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialogBox(
            title: "Login",
            //  descriptions: res.message,
          );
        },
      );
    }
  }
}
