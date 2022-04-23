import 'package:acs_staff/@core/repository/models/order.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../@core/repository/models/Profile.dart';
import '../@core/repository/repo/service.repo.dart';
import '../@core/repository/storage/data.storage.dart';
import '../@share/constants/value.constant.dart';
import '../@share/utils/util.dart';

class ScheduleTodayController extends GetxController {
  final _serviceRepo = Get.find<ServiceRepo>();

  var listOrder = <Order>[].obs;

  @override
  void onReady() {
    getOrders();
    super.onReady();
  }

  getOrders() async {
    showLoading();
    Profile? prof = Get.find<DataStorage>().getToken();
    if(prof != null){
      await _serviceRepo.getOrderByStaffId(staffId: prof.id ?? 0, map: {
        "date": DateFormat(FORMAT_DAY).format(DateTime.now())
      }).then((value) => {
        if (value != null){
            listOrder.value = value,
        }
        else
          showSnackBar(title: "Báo lỗi", content: "createWorkSlot Lỗi"),
        });
      hideLoading();
    }
  }
}