class Order {
  int? orderId;
  String? fullName;
  String? description;
  String? phone;
  String? address;
  String? date;
  String? time;
  int? quantity;
  String? orderCreateDate;
  int? orderTotalPrice;
  int? orderStatus;

  Order(
      {this.orderId,
        this.fullName,
        this.description,
        this.phone,
        this.address,
        this.date,
        this.time,
        this.quantity,
        this.orderCreateDate,
        this.orderTotalPrice,
        this.orderStatus});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    fullName = json['full_name'];
    description = json['description'];
    phone = json['phone'];
    address = json['address'];
    date = json['date'];
    time = json['time'];
    quantity = json['quantity'];
    orderCreateDate = json['order_createDate'];
    orderTotalPrice = json['order_totalPrice'];
    orderStatus = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['full_name'] = this.fullName;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['date'] = this.date;
    data['time'] = this.time;
    data['quantity'] = this.quantity;
    data['order_createDate'] = this.orderCreateDate;
    data['order_totalPrice'] = this.orderTotalPrice;
    data['order_status'] = this.orderStatus;
    return data;
  }
}