import 'package:expense_fusion/utils/select_image.dart';
import 'constants.dart';


class AppImage{
  AppImage._();
  static String get splash=>setImage('$imagePath/splash.png');
}
class AppIcon{
  AppIcon._();
  static String get arrowLeft=>setImage('$iconPath/arrow_left.png');
  static String get menu=>setImage('$iconPath/menu_bar.png');
  static String get userLogo=>setImage('$iconPath/user.png');
  static String get arrowDown=>setImage('$iconPath/arrow_down.png');
  static String get arrowUp=>setImage('$iconPath/arrow_up.png');
  static String get dropDown=>setImage('$iconPath/dropdown_down.png');
  static String get transactionLogo=>setImage('$iconPath/transaction_logo.png');
  static String get add=>setImage('$iconPath/add.png');
  static String get transaction=>('$iconPath/transaction.png');
  static String get logout=>('$iconPath/logout.png');
  static String get spaces=>('$iconPath/spaces.png');
  static String get calender=>('$iconPath/calendar.png');
  static String get unselect=>('$iconPath/unselect.png');
  static String get close=>('$iconPath/close.png');
  static String get select=>('$iconPath/selected.png');
  static String get delete=>('$iconPath/Delete.png');
  static String get edit=>('$iconPath/edit.png');
  static String get option=>('$iconPath/option.png');
  static String get eyeOpen=>('$iconPath/eye_open.png');
  static String get eyeClose=>('$iconPath/eye_close.png');
  static String get login=>('$iconPath/login_logo.png');
}