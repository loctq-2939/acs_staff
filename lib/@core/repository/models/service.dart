class Service {
  int? id;
  int? typeId;
  String? name;
  String? description;
  int? price;
  int? status;
  String? typeName;

  Service(
      {this.id,
        this.typeId,
        this.name,
        this.description,
        this.price,
        this.status,
        this.typeName});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    status = json['status'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['status'] = this.status;
    data['type_name'] = this.typeName;
    return data;
  }
}