import 'package:outfitted_flutter_mobile/model/product.dart';

class ProductApiResponse {
  final List<Product> products;

  ProductApiResponse({this.products});

  factory ProductApiResponse.fromJsonApi(List<dynamic> parsedJson){
    List<Product> list = new List<Product>();
    list = parsedJson.map((i) => Product.fromJsonApi(i)).toList();

    return new ProductApiResponse(products: list);
  }
}
