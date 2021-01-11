import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/Category.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ListScrollHorizontal extends StatefulWidget{

  final String listType, txtEmptyList, txtLastItem;
  final int maxItemsVisible;
  final dynamic list;
  final Function funcOnPressLastItem;

  const ListScrollHorizontal({
    Key key,
    @required this.listType,
    @required this.list,
    @required this.maxItemsVisible,
    this.txtEmptyList = "Empty list",
    this.funcOnPressLastItem,
    this.txtLastItem,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListHorizontal();
}

class _ListHorizontal extends State<ListScrollHorizontal>{

  final String LIST_TYPE_GRID = "Grid", LIST_TYPE_LIST = "List"; // todo: remove?
  double listWidth;

  @override
  Widget build(BuildContext context) {
    listWidth = (widget.listType == "Grid")
        ? ;

     // todo: here if else (check if listtype is GridView ("Grid") or ListView ("List"))
    return widget.list.isEmpty
        ? Center(
      child: Text(
          widget.txtEmptyList,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
          )),
    )
        : _createList();
  }

  Widget _createList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      /*todo: if listview then --> height 80, if gridview --> height: MediaQuery.of(context).size.width * .7*/
      height: isGridView()
          ? MediaQuery.of(context).size.width * .7
          : 80,
      child: isGridView()
          ? _getGridView()
          : _getListView(),
    );
  }

  // Gridlist for products
  Widget _getGridView() {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: , // // todo; check for use length of list, maxLength (if exists) OR (maxlength+1) --> if lastItemText exists +1 for the lastItemText
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  /*todo: Check if works else use of other list in this app*/
          crossAxisCount: 1,
          childAspectRatio: 4 / 3,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20),
      padding: EdgeInsets.only(left: 20),
      itemBuilder: (context, index) {
        return productInfo(Product.fromJson(productSearchList[index].data()), context);
      },
    );
  }

  /* todo;
      itemBuilder: (context, index) {
          if(als er nog items in firestore-list zitten EN ){
            return productInfo(Product.fromJson(productSearchList[index].data()), context);
          }
        // return layout van text met txtLastItem
         return container met txtLastItem
        },
   */

  // listview for categories
  Widget _getListView() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: , // todo; check for use length of list, maxLength OR (maxlength+1) --> +1 for the lastItemText
          itemBuilder: (context, index){
            // todo; display here list for listview
            CollectionCategory category = CollectionCategory.fromJson(snapshot.data.docs[index].data());
            return categoryInfo(category, context);
          }
      ),
    ),
  }

  List<Category> getCategories(){

  }

  List<Category> getLatestProducts(){
    // get most recent added products
  }

  bool isGridView(){
    // todo: or do this to decide whether show gridview or listview--> widget.list is List<(Category or Product)>?
    return widget.listType == "Grid";
  }
}