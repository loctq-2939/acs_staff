
import 'dart:ffi';

import 'package:acs_staff/@core/repository/models/Order.dart';
import 'package:acs_staff/@core/repository/models/Slot.dart';

import '../apis/service.api.dart';
import '../models/city.dart';
import '../models/service.dart';

class ServiceRepo {
  final ServiceApi serviceApi;

  ServiceRepo(this.serviceApi);

  Future<List<Slot>?> getSlots({required int staffId}) async {
    var res = await serviceApi.getSlots(staffId: staffId);
    return res?.success == true ? List.from(res?.data).map((e)=> Slot.fromJson(e)).toList() : null;
  }

  Future<bool> createWorkSlot({required Map<String, dynamic> map}) async {
    var res = await serviceApi.createWorkSlot(map);
    return res?.success ?? false;
  }

  Future<List<Order>?> getOrderByStaffId({required int staffId, required Map<String, dynamic> map}) async {
    var res = await serviceApi.getOrderByStaffId(staffId: staffId, map: map);
    return res?.success == true ? List.from(res?.data).map((e)=> Order.fromJson(e)).toList() : null;
  }
}