import 'dart:io';

class OrderDetail {
  int? id;
  int? orderId;
  int? serviceId;
  String? description;
  String? imageUrl;
  int? status;
  int? servicePrice;
  String? serviceName;
  String? staffName;
  File? file;

  OrderDetail(
      {this.id,
        this.orderId,
        this.serviceId,
        this.description,
        this.imageUrl,
        this.status,
        this.servicePrice,
        this.serviceName,
        this.staffName,
        this.file});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    serviceId = json['service_id'];
    description = json['description'];
    imageUrl = json['image_url'];
    status = json['status'];
    servicePrice = json['service_price'];
    serviceName = json['service_name'];
    staffName = json['staff_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['service_id'] = this.serviceId;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['status'] = this.status;
    data['service_price'] = this.servicePrice;
    data['service_name'] = this.serviceName;
    data['staff_name'] = this.staffName;
    return data;
  }
}