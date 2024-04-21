import 'package:catalog_app_cart_view/components/network_widget_img.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class CartViewList extends StatefulWidget {
  const CartViewList({super.key});
  @override
  State<CartViewList> createState() => _CartViewListState();
}

class _CartViewListState extends State<CartViewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Cart List')),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  Expanded(
                    child: PersistentShoppingCart().showCartItems(
                        cartTileWidget: ({required data}) => Card(
                              child: Row(
                                children: [
                                  NetworkImageWidget(
                                      height: 100,
                                      width: 100,
                                      imageUrl:
                                          data.productThumbnail.toString()),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.productName,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          data.productDescription.toString(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              r"$" + data.unitPrice.toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  PersistentShoppingCart()
                                                      .removeFromCart(
                                                          data.productId);
                                                },
                                                icon: const Icon(Icons.delete))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            PersistentShoppingCart()
                                                .incrementCartItemQuantity(
                                                    data.productId);
                                          },
                                          icon: const Icon(Icons.add)),
                                      Text(data.quantity.toString()),
                                      IconButton(
                                          onPressed: () {
                                            PersistentShoppingCart()
                                                .decrementCartItemQuantity(
                                                    data.productId);
                                          },
                                          icon: const Icon(Icons.remove))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        showEmptyCartMsgWidget: const Center(
                            child: Text(
                          "Your Cart List Is Empty",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                        ))),
                  ),
                  PersistentShoppingCart().showTotalAmountWidget(
                    cartTotalAmountWidgetBuilder: (totalAmount) {
                      return Visibility(
                          visible: totalAmount == 0 ? false : true,
                          child: Text(
                            "Rs = ${totalAmount.toString()} \$",
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ));
                    },
                  )
                ]))));
  }
}
