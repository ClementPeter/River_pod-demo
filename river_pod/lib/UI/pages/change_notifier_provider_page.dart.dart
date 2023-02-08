import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/models/product.dart';
import 'package:river_pod/services/cart_change_notifier.dart';

//Demo of ChangeNotiferProvider to add product to cart
class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({this.color, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Watching the provider and rebuilding if there is any chnages
    final cartNotifier = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text(" Change Notifier Provider"),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              //const Icon(Icons.shopping_cart),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(
                              child: Text(
                            "Cart",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...cartNotifier.cart
                                  .map((item) => Text(item.title)),
                              const SizedBox(height: 15),
                              Text(
                                "Total \$${cartNotifier.cart.fold(0, (sum, element) => sum + element.price.toInt())}",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: (() {
                                ref
                                    .watch(cartNotifierProvider.notifier)
                                    .clear();
                              }),
                              child: const Text("Clear"),
                            )
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                top: 6,
                right: 0,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  // constraints:                      const BoxConstraints(minHeight: 16, minWidth: 16),
                  child: Center(
                    child: Text(
                      cartNotifier.cart.length
                          .toString(), //passing the lenght of the cart with the provider above
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 30)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      onPressed: () {
                        //.read is more ideal here than .watch
                        //cos we dont need to listen to addProduct method in cartNotifier.dart
                        //.watch triggers a rebuild of the Icon which is expensive in terms of App performance
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addProduct(product);
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
