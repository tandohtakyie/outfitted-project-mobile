class Product{
  String name;
  String productImage;
  String supplier;
  String productDescription;
  int stock;
  double price;

  Product({
    this.name,
    this.productImage,
    this.supplier,
    this.productDescription,
    this.stock,
    this.price
  });

  Product.fromJson(Map<String, dynamic> json){
    name = json['name'];
    productImage = json['productImage'];
    supplier = json['supplier'];
    productDescription = json['productDescription'];
    stock = json['stock'];
    //price = json['price'];
    // stock = int.parse(json['stock']);
    price = double.parse(json['price'].toString());
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    name = json['name'];
    productImage = json['productImage'];
    supplier = json['supplier'];
    productDescription = json['productDescription'];
    stock = int.parse(json['stock'].toString());
    price = double.parse(json['price'].toString());
  }

  Map<String, dynamic> toJsonApi(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

// Dummy data for cart /*todo: if you want to use photos from url read this: https://flutter.dev/docs/cookbook/images/network-image*/
List<Product> dummyProducts = [
  Product(name: "Nike sneakers", productImage: "sneaker_nike_1.jpg", supplier: "Nike", productDescription: "These shoes are lit", stock: 30, price: 50.00),
  Product(name: "Nike sneakers", productImage: "sneaker_nike_2.jpg", supplier: "Nike", productDescription: "Nice shoes", stock: 30, price: 70.00),
  Product(name: "Vans Old Skool", productImage: "sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Skateboard shoes", stock: 30, price: 54.00),
  Product(name: "Vans Sk8-hi", productImage: "sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Let's skate men!", stock: 30, price: 37.00),
];
