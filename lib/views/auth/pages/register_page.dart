import '../../../utils/exports.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidePwd = true;
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
    void signUp() async {
      try {
        service.registerUser(
            username: _usernameController.text,
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } catch (e) {
        print("error $e");
      }
    }

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
            child: Column(
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
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Gap(50),
                CustomTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                  leadingIcon: const Icon(
                    Icons.person_2_rounded,
                    color: Colors.grey,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 10,
                ),
                const Gap(10),
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
                    Icons.lock_clock_outlined,
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
                  controller: _registerBtnController,
                  onPressed: signUp,
                  child: const Text(
                    "Register",
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
      ),
    );
  }
}
