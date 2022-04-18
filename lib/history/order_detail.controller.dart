import 'package:get/get.dart';

import '../@core/repository/models/Order.dart';
import '../@core/repository/repo/service.repo.dart';

class OrderDetailController extends GetxController {
  final _serviceRepo = Get.find<ServiceRepo>();

  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  var order = Order().obs;


  @override
  void onReady() {
    order.value = Get.arguments[0];
    super.onReady();
  }
}