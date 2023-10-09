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
