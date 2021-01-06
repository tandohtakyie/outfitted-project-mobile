
class Product{
  String id;
  String name;
  String productImage;
  String supplier;
  String productDescription;
  int stock;
  double price;

  Product._privateConstructor();

  static final Product instance = Product._privateConstructor();

  factory Product(){
    return instance;
  }

  @override
  String toString() {
    return this.name + " " + this.id;
  }

  // Product({
  //   this.id,
  //   this.name,
  //   this.productImage,
  //   this.supplier,
  //   this.productDescription,
  //   this.stock,
  //   this.price
  // });

 fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    productImage = json['productImage'];
    supplier = json['supplier'];
    productDescription = json['productDescription'];
    stock = json['stock'];
    price = double.parse(json['price'].toString());
  }

  Product getFromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    productImage = json['productImage'];
    supplier = json['supplier'];
    productDescription = json['productDescription'];
    stock = json['stock'];
    price = double.parse(json['price'].toString());

    return this;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['productImage'] = this.productImage;
    data['supplier'] = this.supplier;
    data['productDescription'] = this.productDescription;
    data['stock'] = this.stock;
    data['price'] = this.price;

    return data;
  }

  // When using the API

  Product.fromJsonApi(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    productImage = json['productImage'];
    supplier = json['supplier'];
    productDescription = json['productDescription'];
    stock = int.parse(json['stock'].toString());
    price = double.parse(json['price'].toString());
  }

  Map<String, dynamic> toJsonApi(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['productImage'] = this.productImage;
    data['supplier'] = this.supplier;
    data['productDescription'] = this.productDescription;
    data['stock'] = this.stock.toString();
    data['price'] = this.price.toString();

    return data;
  }
// End of API
}

