import '../utils/exports.dart';

class MenuTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String menuTitle;
  final Color boxColor;
  final Color iconColor;
  const MenuTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.menuTitle,
    required this.boxColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1))
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: boxColor),
                child: Icon(
                  icon,
                )),
            title: Text(menuTitle),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
