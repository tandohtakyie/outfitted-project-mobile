
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:outfitted_flutter_mobile/model/CollectionCategory.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';

import 'firebase_config.dart';

class FirebasePreparedData {

  static List<CollectionCategory> collectionCategories = [
    CollectionCategory(categoryName:"Accessories", categoryImage:"assets/images/category_bg_accessories.png"),
    CollectionCategory(categoryName:"Shoes", categoryImage:"assets/images/category_bg_shoes.png"),
    CollectionCategory(categoryName:"T-Shirts", categoryImage:"assets/images/category_bg_tshirts.jpg"),
    CollectionCategory(categoryName:"Sweaters", categoryImage:"assets/images/category_bg_sweaters.jpeg"),
    CollectionCategory(categoryName:"Hoodies", categoryImage:"assets/images/category_bg_hoodies.jpg"),
    CollectionCategory(categoryName:"Pants", categoryImage:"assets/images/category_bg_pants.jpg"),
    CollectionCategory(categoryName:"Socks", categoryImage:"assets/images/category_bg_socks.jpg"),
    CollectionCategory(categoryName:"Jackets", categoryImage:"assets/images/category_bg_jackets.jpg"),
  ];

  static insertCollectionCategories() async {
    for (int i = 0; i < collectionCategories.length; i++) {
        FirebaseFirestore.instance
            .collection(OutFittedApp.collectionCategory)
            .doc(i.toString())
            .set({
          "categoryName": collectionCategories[i].categoryName,
          "categoryImage": collectionCategories[i].categoryImage,
        });
    }

    // collectionCategories.forEach((category) {
    //   FirebaseFirestore.instance
    //       .collection(OutFittedApp.collectionCategory)
    //       .doc(fUser.uid)
    //       .set({
    //     "uid": fUser.uid,
    //     "email": fUser.email,
    //     "name": name.text.trim(),
    //     OutFittedApp.customerCartList: ["garbageValue"],
    //     OutFittedApp.customerWishList: ["garbageValue"],
    //   });
    // });
  }

  static List<Product> productShoes = [
    Product(id: 0, name: "Nike sneakers", productImage: "assets/images/sneaker_nike_1.jpg", supplier: "Nike", productDescription: "These shoes are lit", stock: 30, price: 50),
    Product(id: 1, name: "Nike sneakers", productImage: "assets/images/sneaker_nike_2.jpg", supplier: "Nike", productDescription: "Nice shoes", stock: 30, price: 70),
    Product(id: 2, name: "Vans Old Skool", productImage: "assets/images/sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Skateboard shoes", stock: 30, price: 54),
    Product(id: 3, name: "Vans Sk8-hi", productImage: "assets/images/sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Let's skate men!", stock: 30, price: 37),
  ];

  List<Product> productTShirts = [
    Product(id: 0, name: "Nike sneakers", productImage: "assets/images/sneaker_nike_1.jpg", supplier: "Nike", productDescription: "These shoes are lit", stock: 30, price: 50),
    Product(id: 1, name: "Nike sneakers", productImage: "assets/images/sneaker_nike_2.jpg", supplier: "Nike", productDescription: "Nice shoes", stock: 30, price: 70),
    Product(id: 2, name: "Vans Old Skool", productImage: "assets/images/sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Skateboard shoes", stock: 30, price: 54),
    Product(id: 3, name: "Vans Sk8-hi", productImage: "assets/images/sneaker_vans_1.jpg", supplier: "Vans", productDescription: "Let's skate men!", stock: 30, price: 37),
  ];

}