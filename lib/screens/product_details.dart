import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marpo_app/models/product.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../api/product.dart';
import '../blocs/pdf_bloc/bloc/pdf_bloc_bloc.dart';
import '../blocs/search_bloc/bloc/search_product_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(product.description, product.fullBrandImg),
        SliverList(
            delegate: SliverChildListDelegate([
          _Preview(product: product),
          _Details(
            product: product,
          ),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar(this.title, this.imageUrl);
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        titlePadding: const EdgeInsets.symmetric(horizontal: 10),
        centerTitle: true,
        background: Padding(
          padding:
              const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 5),
          child: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(imageUrl),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/loading.gif");
            },
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _Preview extends StatelessWidget {
  const _Preview({required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(product.fullMainImg),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/images/no-image.jpg");
              },
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.department,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.code,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      product.key,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Disponibilidad  : ${product.inventory}"),
                const SizedBox(height: 10),
                Text(product.unit),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Details extends StatelessWidget {
  final ProductModel product;

  const _Details({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            "\$${product.retailsale.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            "\$${product.wholesale.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.caption,
          ),
          BarcodeWidget(
            barcode: Barcode.code128(),
            data: product.codebar,
            height: 100,
          ),
          ElevatedButton(
              onPressed: () async {
                final pdf = PDFApi();
                var result = await pdf.getPDFUrl(product.code);
                result = result.replaceAll('"', '');
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, 'pdf', arguments: result);
              },
              child: const Text("PDF"))
        ],
      ),
    );
  }
}
