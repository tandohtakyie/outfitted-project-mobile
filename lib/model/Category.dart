class Category {
  String categoryName;

  Category({this.categoryName});

   Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.categoryName;

    return data;
  }
}
