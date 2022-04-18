
import 'package:acs_staff/@share/router/pages.dart';
import 'package:acs_staff/history/order_detail.dart';
import 'package:acs_staff/login/login.dart';
import 'package:acs_staff/schedule/register_schedule/register_schedule.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../bottom_nav_bar.dart';
import '../../build_nav_bar.binding.dart';
import '../../history/oder_detail.binding.dart';
import '../../login/login.binding.dart';
import '../../schedule/register_schedule/register_schedule.binding.dart';

class Routers {
  static final route = [
    GetPage(name: ROUTER_NAVBAR, page: () => const BuildBottomNavBar(), binding: NavBarBinding()),
    GetPage(name: ROUTE_REGISTER_SCHEDULE, page: () => const RegisterScheduleScreen(), binding: RegisterScheduleBinding()),
    GetPage(name: ROUTER_LOGIN, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: ROUTE_ORDER_DETAIL, page: () => const OrderDetailScreen(), binding: OrderDetailBinding()),
  ];
}
