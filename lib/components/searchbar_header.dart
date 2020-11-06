import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/size_config.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class SearchBarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
