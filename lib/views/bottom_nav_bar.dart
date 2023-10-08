import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lets_chat/controllers/page_controller.dart';
import 'package:lets_chat/widgets/bottom_icons.dart';
import 'package:provider/provider.dart';
import '../utils/exports.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavBarIcons(
                isSelected: mainScreenNotifier.selectedIndex == 0,
                onTap: () {
                  mainScreenNotifier.selectedIndex = 0;
                },
                iconData: mainScreenNotifier.selectedIndex == 0
                    ? MaterialCommunityIcons.home
                    : MaterialCommunityIcons.home_outline,
              ),
              BottomNavBarIcons(
                  isSelected: mainScreenNotifier.selectedIndex == 1,
                  onTap: () {
                    mainScreenNotifier.selectedIndex = 1;
                  },
                  iconData: mainScreenNotifier.selectedIndex == 1
                      ? Ionicons.menu
                      : Ionicons.menu_outline),
              BottomNavBarIcons(
                  isSelected: mainScreenNotifier.selectedIndex == 2,
                  onTap: () {
                    mainScreenNotifier.selectedIndex = 2;
                  },
                  iconData: mainScreenNotifier.selectedIndex == 2
                      ? Ionicons.person
                      : Ionicons.person_outline),
            ],
          ),
        ),
      );
    });
  }
}
