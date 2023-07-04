import 'package:get/get.dart';
import 'package:tax_robot_app/pages/index.dart';
import './app_routes.dart';

class AppPages {
  // default route
  static const INITIAL = AppRoutes.Robot;

  static final routes = [
    GetPage(
        name: AppRoutes.Base,
        page: () => Robor(),
    )
  ];
}
