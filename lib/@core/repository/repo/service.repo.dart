
import 'dart:ffi';
import 'dart:io';

import 'package:acs_staff/@core/repository/models/order.dart';
import 'package:acs_staff/@core/repository/models/Slot.dart';
import 'package:acs_staff/@core/repository/models/order_detail.dart';

import '../apis/service.api.dart';
import '../models/city.dart';
import '../models/service.dart';

class ServiceRepo {
  final ServiceApi serviceApi;

  ServiceRepo(this.serviceApi);

  Future<List<Service>?> getService() async {
    var res = await serviceApi.getServices();
    return res?.success == true ? List.from(res?.data).map((e) => Service.fromJson(e)).toList() : null;
  }

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

  Future<bool> updateImageOrder({required int id, required File file}) async {
    var res = await serviceApi.updateImageOrder(id: id, file: file);
    return res?.success ?? false;
  }

  Future<List<OrderDetail>?> getOrderDetailsByOrderId({required int orderId}) async {
    var res = await serviceApi.getOrderDetailsByOrderId(orderId: orderId);
    return res?.success == true ? List.from(res?.data).map((e)=> OrderDetail.fromJson(e)).toList() : null;
  }

  Future<bool> createOrderDetail({required Map<String, dynamic> map}) async {
    var res = await serviceApi.createOrderDetail(map);
    return res?.success ?? false;
  }

  Future<bool> doneOrderDetail({required int orderDetailId}) async {
    var res = await serviceApi.doneOrderDetail(orderDetailId: orderDetailId);
    return res?.success ?? false;
  }

  Future<bool> doneOrder({required int orderId}) async {
    var res = await serviceApi.doneOrder(orderId: orderId);
    return res?.success ?? false;
  }
}