import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:marpo_app/models/product.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        height: size.height * 0.6,
        child: Column(
          children: [
            Text("Últimos Productos",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Swiper(
              itemCount: products.length,
              layout: SwiperLayout.STACK,
              itemWidth: size.width * 0.6,
              itemHeight: size.height * 0.5,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'details',
                      arguments: products[index]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Theme.of(context).backgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            products[index].description,
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.center,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              placeholder:
                                  const AssetImage('assets/shopping-cart.png'),
                              // image: const AssetImage('assets/no-image.jpg'),
                              image: NetworkImage(products[index].fullMainImg),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset("assets/shopping-cart.png");
                              },
                              width: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "\$${products[index].retailsale.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "\$${products[index].wholesale.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.caption,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ));
  }
}
