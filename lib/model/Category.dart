class Category {
  String categoryName;
 // String categoryImage;

  Category({
    this.categoryName,
  //  this.categoryImage,
  });

   Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['name'];
 //   categoryImage = json['categoryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.categoryName;
   // data['categoryImage'] = this.categoryImage;

    return data;
  }
}
