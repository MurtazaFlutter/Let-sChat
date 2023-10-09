import 'package:timeago/timeago.dart' as timeago;

class AppUtil {
  static getTimeAgo(DateTime dt) {
    return timeago.format(dt, allowFromNow: true, locale: 'en_short');
  }
}
