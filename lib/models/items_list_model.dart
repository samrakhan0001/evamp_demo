class ItemsApiModel {
  String? status;
  List<Items>? items;

  ItemsApiModel({this.status, this.items});

  ItemsApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? itemImage;
  String? name;
  String? description;
  int? price;

  Items({this.id, this.itemImage, this.name, this.description, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemImage = json['itemImage'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['itemImage'] = this.itemImage;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}