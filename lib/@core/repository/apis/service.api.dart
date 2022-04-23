

import 'dart:io';

import '../response/base.response.dart';
import 'base_connect.api.dart';

class ServiceApi extends BaseConnect {

  Future<BaseResponse?> getServices() async {
    return await getResponse('/service/all');
  }

  Future<BaseResponse?> getSlots({required int staffId}) async {
    return await getResponse('/workSlot/$staffId/staffId');
  }

  Future<BaseResponse?> createWorkSlot(Map<String, dynamic> map) async {
    return await postRequest('/workSlot/create', query: map);
  }

  Future<BaseResponse?> getDistrictByCity({required int cityId}) async {
    return await getResponse('/district/$cityId');
  }

  Future<BaseResponse?> getOrderByStaffId({required int staffId,  required Map<String, dynamic> map}) async {
    return await getResponse('/order/$staffId/staffId', query: map);
  }

  Future<BaseResponse?> updateImageOrder({required int id, required File file}) async {
    return await putFormDataRequest('/orderDetail/update/$id/image', file);
  }

  Future<BaseResponse?> getOrderDetailsByOrderId({required int orderId}) async {
    return await getResponse('/orderDetail/$orderId/manager');
  }

  Future<BaseResponse?> createOrderDetail(Map<String, dynamic> map) async {
    return await postRequest('/orderDetail/create', query: map);
  }

  Future<BaseResponse?> doneOrderDetail({required int orderDetailId}) async {
    return await pathRequest('/orderDetail/done/$orderDetailId');
  }

  Future<BaseResponse?> doneOrder({required int orderId}) async {
    return await pathRequest('/order/done/$orderId');
  }



}

