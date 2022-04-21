import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../@core/repository/models/Order.dart';
import '../@core/repository/repo/service.repo.dart';
import '../@share/utils/util.dart';

class OrderDetailController extends GetxController {
  final _serviceRepo = Get.find<ServiceRepo>();

  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  var order = Order().obs;
  final ImagePicker _picker = ImagePicker();
  XFile? photo;
  var filePhoto = File("").obs;

  @override
  void onReady() {
    order.value = Get.arguments[0];
    super.onReady();
  }

  getImage() async {
    photo = await _picker.pickImage(source: ImageSource.gallery);
    var path = photo?.path;
    if(path != null){
      filePhoto.value = File(path);
    }
  }

  bool isExists() {
    return filePhoto.value.existsSync();
  }

  updateImage() async {
    var orderId = order.value.orderId;
    if(orderId != null && isExists()){
      showLoading();
      await _serviceRepo.updateImageOrder(id: orderId, file: filePhoto.value).then((value) => {
        if (value){
          showSnackBar(title: "Thành Công", content: "Thành Công"),
        }
        else
          showSnackBar(title: "Báo lỗi", content: "createWorkSlot Lỗi"),
      });
      hideLoading();
    }
  }
}