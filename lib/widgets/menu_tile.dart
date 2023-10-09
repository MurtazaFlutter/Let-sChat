import '../utils/exports.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String menuTitle;
  final Color boxColor;
  final Color iconColor;
  const MenuTile({
    super.key,
    required this.icon,
    required this.menuTitle,
    required this.boxColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: boxColor),
              child: Icon(
                icon,
                color: iconColor,
              )),
          title: Text(menuTitle),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      ),
    );
  }
}
