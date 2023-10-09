import 'package:lets_chat/utils/exports.dart';
import 'package:lets_chat/widgets/menu_tile.dart';

class AccountProfileScreen extends StatelessWidget {
  const AccountProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          children: [
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/icons/chat.png"),
                  ),
                  Gap(20),
                  Text(
                    "Ghulam Murtaza",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "murtaza@gmail.com",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Gap(30),
            MenuTile(
                icon: Icons.dark_mode_outlined,
                menuTitle: 'Appearance',
                boxColor: Colors.blue.shade100,
                iconColor: Colors.blueAccent),
            MenuTile(
              icon: Icons.notifications_none_outlined,
              menuTitle: 'Notifications',
              boxColor: Colors.red.shade100,
              iconColor: AppColor.secondary,
            ),
            MenuTile(
                icon: Icons.privacy_tip_outlined,
                menuTitle: 'Privacy',
                boxColor: Colors.teal.shade100,
                iconColor: Colors.teal),
            MenuTile(
                icon: Icons.lock_outline,
                menuTitle: 'Change Password',
                boxColor: Colors.orange.shade100,
                iconColor: Colors.orange),
            MenuTile(
                icon: Icons.logout_outlined,
                menuTitle: 'Log Out',
                boxColor: Colors.grey.shade100,
                iconColor: Colors.grey),
          ],
        )));
  }
}
