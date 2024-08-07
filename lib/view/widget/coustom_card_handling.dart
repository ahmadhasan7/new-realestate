import 'package:flutter/material.dart';
import 'package:realestate/view/widget/property_card.dart';
class CoustomCardHandling extends StatelessWidget {
  const CoustomCardHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 4,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.53,
            mainAxisSpacing: 0.5,
            crossAxisSpacing: 11),
        itemBuilder: (context, index) {
          return CoustomPropertyCard(
              isuserproperty: false,
              cover: "",
              title: "",
              street: "",
              location: "",
              price: "",
              isfav: false,
              onFavPressed: () {},
              onDeletePressed: () {},
              onUpdatePressed: () {}, istrad: '', ownertybe: '',);
        });
  }
}
