
class Product{
  int id, stock;
  String category, name, productImage, supplier, productDescription;
  double price;

  Product({
    this.id,
    this.category,
    this.name,
    this.productImage,
    this.supplier,
    this.productDescription,
    this.stock,
    this.price
  });

  Product.fromJson(Map<String, dynamic> json){
    // id = json['id']; @todo: @Gibbs we need to fix this
    name = json['name'];
    category = json['category'];
    productImage = json['productImage'];
    supplier = json['supplier'];
    productDescription = json['productDescription'];
    stock = json['stock'];
    //price = json['price'];
    // stock = int.parse(json['stock']);
    price = double.parse(json['price'].toString().replaceAll(',','.'));
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
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
    category = json['category'];
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
    data['category'] = this.category;
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

List<Product> dummyProducts = [
  Product(id: 0, name: "Nike sneakers", productImage: "assets/images/sneaker_nike_1.jpg", supplier: "Nike", productDescription: "These shoes are lit", stock: 30, price: 50),
  Product(id: 1, name: "Nike sneakers", productImage: "assets/images/sneaker_nike_2.jpg", supplier: "Nike", productDescription: "Nice shoes", stock: 30, price: 70),
  Product(id: 2, name: "Vans Old Skool", productImage: "assets/images/sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Skateboard shoes", stock: 30, price: 54),
  Product(id: 3, name: "Vans Sk8-hi", productImage: "assets/images/sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Let's skate men!", stock: 30, price: 37),
];
