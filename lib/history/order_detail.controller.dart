import 'dart:io';

import 'package:acs_staff/@core/repository/models/order_detail.dart';
import 'package:acs_staff/@core/repository/models/service.dart';
import 'package:acs_staff/@share/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../@core/repository/models/order.dart';
import '../@core/repository/repo/service.repo.dart';
import '../@share/utils/util.dart';

class OrderDetailController extends GetxController {
  final _serviceRepo = Get.find<ServiceRepo>();

  final items = <Service>[].obs;
  final serviceSelected = Service().obs;

  var order = Order().obs;
  final ImagePicker _picker = ImagePicker();
  XFile? photo;
  var filePhoto = File("").obs;

  var orderDetails = <OrderDetail>[].obs;
  final orderFormKey = GlobalKey<FormState>();

  final descriptionController = TextEditingController();

  String? validator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 6 ||
        value.length > 40) {
      return 'Tên tài khoản không hợp lệ !';
    }
    return null;
  }

  @override
  void onReady() {
    order.value = Get.arguments[0];
    getService();
    getOrderDetailsByOrderId();
    super.onReady();
  }

  Future<OrderDetail?> getImage(OrderDetail orderDetail) async {
    photo = await _picker.pickImage(source: ImageSource.gallery);
    var path = photo?.path;
    if(path != null){
      orderDetail.file = File(path);
      return orderDetail;
    }
    return null;
  }

  bool isExists(File? file) {
    return file != null ?  file.existsSync() : false;
  }

  updateImage(OrderDetail orderDetail) async {
    var orderId = orderDetail.id;
    var file = orderDetail.file;
    if(orderId != null && file != null && isExists(file)){
      showLoading();
      await _serviceRepo.updateImageOrder(id: orderId, file: file).then((value) => {
        if (value){
          showSnackBar(title: "Thành công", content: "Cập nhật ảnh thành công"),
          getOrderDetailsByOrderId()
        }
        else
          showSnackBar(title: "Báo lỗi", content: "updateImage Lỗi"),
      });
      hideLoading();
    }
  }

  getOrderDetailsByOrderId() async {
    var orderId = order.value.orderId;
    if(orderId != null){
      showLoading();
      await _serviceRepo.getOrderDetailsByOrderId(orderId: orderId).then((value) => {
        if (value != null){
          orderDetails.value = value
        }
        else
          showSnackBar(title: "Báo lỗi", content: "getOrderDetailsByOrderId Lỗi"),
      });
      hideLoading();
    }
  }

  getService() async {
      showLoading();
      await _serviceRepo.getService().then((value) => {
        if (value != null){
          items.value = value
        }
        else
          showSnackBar(title: "Báo lỗi", content: "getService Lỗi"),
      });
      hideLoading();
  }

  createOrderDetail() async {
    var orderId = order.value.orderId;
    if(orderId != null && serviceSelected.value.id != null) {
      showLoading();
      await _serviceRepo.createOrderDetail(map: {
        "description": descriptionController.text.toString(),
        "order_id": orderId.toString(),
        "price": serviceSelected.value.price.toString(),
        "service_id": serviceSelected.value.id.toString()
      }).then((value) =>
      {
        if (value){
          getOrderDetailsByOrderId()
        }
        else
          showSnackBar(title: "Báo lỗi", content: "createOrderDetail Lỗi"),
      });
      hideLoading();
      goBack();
    }
  }

  doneOrderDetail(int? orderDetailId) async {
    if(orderDetailId != null) {
      showLoading();
      await _serviceRepo.doneOrderDetail(orderDetailId: orderDetailId).then((
          value) =>
      {
        if (value){
          showSnackBar(title: "Thành Công", content: "doneOrderDetail Thành Công"),
        }
        else
          showSnackBar(title: "Báo lỗi", content: "doneOrderDetail Lỗi"),
      });
      hideLoading();
    }
  }

  doneOrder() async {
    var orderId = order.value.orderId;
    if(orderId != null) {
      showLoading();
      await _serviceRepo.doneOrder(orderId: orderId).then((value) =>
      {
        if (value){
          goToAndRemoveAll(screen: ROUTER_NAVBAR),
          showSnackBar(title: "Thành Công", content: "doneOrder Thành Công"),
        }
        else
          showSnackBar(title: "Báo lỗi", content: "doneOrder Lỗi"),
      });
      hideLoading();
    }
  }

}