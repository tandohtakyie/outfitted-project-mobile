
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:outfitted_flutter_mobile/model/CollectionCategory.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';

import 'firebase_config.dart';

class FirebasePreparedData {

  static String nikeShoesJson = '[{"category":"Shoes","name":"NIKE AIR MAX COMMAND LEATHER ","price":"129,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0047-018_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX COMMAND ","price":"129,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0044-027_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX COMMAND LEATHER ","price":"129,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_7R1A0159-024_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX COMMAND LEATHER ","price":"129,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_7R1A0159-001_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX LTD 3 ","price":"119,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0043-028_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX LTD 3 ","price":"119,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0042-106_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX LTD 3 ","price":"119,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0009-003_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX LTD 3 ","price":"119,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0010-111_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX EXCEE LEATHER ","price":"109,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0049-003_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX EXCEE ","price":"109,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0045-028_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"},{"category":"Shoes","name":"NIKE AIR MAX EXCEE ","price":"109,99","productDescription":"Nike, Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.","productImage":"https://i8.amplience.net/t/jpl/jd_product_list?plu=ak_1R1E0045-105_a&qlt=92&w=363&h=363&v=1&fmt=webp","stock":33,"supplier":"Nike"}]';

  static addNikeShoes(){
    addProductsFromJson(nikeShoesJson,0);
  }

  static addProductsFromJson(String pJson, int idIndexFrom){
    var tagObjsJson = jsonDecode(pJson) as List;
    List<Product> productObjs = tagObjsJson.map((tagJson) => Product.fromJson(tagJson)).toList();

    print(productObjs.length);
    idIndexFrom++;
    for (int i = 0; i < productObjs.length; i++) {
      FirebaseFirestore.instance
          .collection(OutFittedApp.collectionProduct)
          .doc(idIndexFrom.toString())
          .set({
        "category": productObjs[i].category,
        "name": productObjs[i].name,
        "price": productObjs[i].price,
        "productDescription": productObjs[i].productDescription,
        "productImage": productObjs[i].productImage,
        "stock": productObjs[i].stock,
        "supplier": productObjs[i].supplier,
      });
    }
  }

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