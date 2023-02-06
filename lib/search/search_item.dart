import 'package:flutter/material.dart';
import 'package:marpo_app/models/product.dart';

class SearchItem extends StatelessWidget {
  final String urlImage;
  final ProductModel product;
  const SearchItem({super.key, required this.urlImage, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage(urlImage),
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset("assets/images/no-image.jpg");
        },
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(
        "${product.description} \t \$${product.retailsale.toStringAsFixed(2)}",
        softWrap: true,
        maxLines: 4,
      ),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: product),
    );
  }
}
