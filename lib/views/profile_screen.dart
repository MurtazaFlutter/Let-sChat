import 'package:lets_chat/utils/exports.dart';
import 'package:lets_chat/widgets/menu_tile.dart';

class AccountProfileScreen extends StatefulWidget {
  const AccountProfileScreen({super.key});

  @override
  State<AccountProfileScreen> createState() => _AccountProfileScreenState();
}

class _AccountProfileScreenState extends State<AccountProfileScreen> {
  late AuthService service;
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    service = AuthService();
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final response = await service.getUserData(currentUser.uid);
      setState(() {
        userData = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/icons/chat.png"),
                    ),
                    const Gap(20),
                    Text(
                      userData['username'] ?? 'loading',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userData['email'] ?? 'loading',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              MenuTile(
                icon: Icons.person,
                menuTitle: 'Edit Profile',
                boxColor: Colors.green.shade100,
                iconColor: Colors.green,
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.dark_mode_outlined,
                menuTitle: 'Appearance',
                boxColor: Colors.blue.shade100,
                iconColor: Colors.blueAccent,
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.notifications_none_outlined,
                menuTitle: 'Notifications',
                boxColor: Colors.red.shade100,
                iconColor: AppColor.secondary,
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.share,
                menuTitle: 'Privacy',
                boxColor: Colors.teal.shade100,
                iconColor: Colors.teal,
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.lock_outline,
                menuTitle: 'Change Password',
                boxColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.logout_outlined,
                menuTitle: 'Log Out',
                boxColor: Colors.grey.shade100,
                iconColor: Colors.grey,
                onTap: () => service.logout(),
              ),
            ],
          ),
        ));
  }
}
