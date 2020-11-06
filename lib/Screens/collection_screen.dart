import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("products").limit(20).snapshots(),
      builder: (context, dataSnapshot) {
        return !dataSnapshot.hasData
            ? SliverToBoxAdapter(
                child: Center(
                  child: Text("Data loading"),
                ),
              )
            : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                itemBuilder: (context, index) {},
              );
      },
    );
  }
}
