import 'package:acs_staff/history/order_detail.controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../@core/repository/apis/service.api.dart';
import '../@core/repository/repo/service.repo.dart';
import '../@core/repository/storage/data.storage.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataStorage());
    Get.lazyPut(() => ServiceApi());
    Get.put(ServiceRepo(Get.find()));
    Get.lazyPut(() => OrderDetailController());
  }
}