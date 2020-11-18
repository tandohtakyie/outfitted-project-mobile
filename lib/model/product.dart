class Product{
  String name;
  String productImage;
  String supplier;
  String productDescription;

  Product({
    this.name,
    this.productImage,
    this.supplier,
    this.productDescription
  });

  Product.fromJson(Map<String, dynamic> json){
    name = json['name'];
    productImage = json['productImage'];
    supplier = json['supplier'];
    productDescription = json['productDescription'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['productImage'] = this.productImage;
    data['supplier'] = this.supplier;
    data['productDescription'] = this.productDescription;

    return data;
  }
}
