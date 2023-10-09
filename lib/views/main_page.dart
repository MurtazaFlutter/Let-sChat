import 'package:lets_chat/views/bottom_nav_bar.dart';
import 'package:lets_chat/views/messages/chats_page.dart';
import 'package:lets_chat/views/home_page.dart';
import 'package:lets_chat/views/profile_screen.dart';
import 'package:provider/provider.dart';

import '../controllers/page_controller.dart';
import '../utils/exports.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [
    const HomePage(),
    const ChatsPage(),
    const AccountProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        body: pageList[mainScreenNotifier.selectedIndex],
        bottomNavigationBar: const BottomBar(),
      );
    });
  }
}
