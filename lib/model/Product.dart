/* todo: round price into two decimals. Currently only one decimal visible.*/

/* todo: @Gibbs de products in database moeten nog attribute 'id' krijgen (ik kan het ook doen, maar heb dan je hulp nodig)*/

/*todo: @Gibbs de prijzen van products moeten in onze app weergegeven worden met twee decimalen. (ik kan het ook doen, maar heb dan je hulp nodig)
   check dit: https://bezkoder.com/dart-round-double/#:~:text=Dart%20round%20double%20to%20N%20decimal%20places,-We%20have%202&text=%E2%80%93%20Multiply%20the%20number%20by%2010,12.3412%20*%2010%5E2%20%3D%201234.12 */
class Product{
  int id;
  String name;
  String productImage;
  String supplier;
  String productDescription;
  int stock;
  double price;

  Product({
    this.id,
    this.name,
    this.productImage,
    this.supplier,
    this.productDescription,
    this.stock,
    this.price
  });

  Product.fromJson(Map<String, dynamic> json){
    name = json['id'];
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

// Dummy data for cart /*todo: if you want to use photos from url read this: https://flutter.dev/docs/cookbook/images/network-image*/
List<Product> dummyProducts = [
  Product(id: 0, name: "Nike sneakers", productImage: "assets/images/sneaker_nike_1.jpg", supplier: "Nike", productDescription: "These shoes are lit", stock: 30, price: 50),
  Product(id: 1, name: "Nike sneakers", productImage: "assets/images/sneaker_nike_2.jpg", supplier: "Nike", productDescription: "Nice shoes", stock: 30, price: 70),
  Product(id: 2, name: "Vans Old Skool", productImage: "assets/images/sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Skateboard shoes", stock: 30, price: 54),
  Product(id: 3, name: "Vans Sk8-hi", productImage: "assets/images/sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Let's skate men!", stock: 30, price: 37),
];
