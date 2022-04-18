
import 'package:acs_staff/schedule/register_schedule/register_schedule.controller.dart';
import 'package:acs_staff/schedule/schedule_today.controller.dart';
import 'package:acs_staff/schedule/schedule_week/schedule_week.controller.dart';
import 'package:get/get.dart';

import '@core/repository/apis/service.api.dart';
import '@core/repository/repo/service.repo.dart';
import '@core/repository/storage/data.storage.dart';
import 'build_nav_bar.controller.dart';


class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataStorage());
    Get.lazyPut(() => ServiceApi());
    Get.put(ServiceRepo(Get.find()));
    Get.lazyPut(() => NavBarController());
    Get.lazyPut(() => ScheduleWeekController());
    Get.lazyPut(() => ScheduleTodayController());
  }
}