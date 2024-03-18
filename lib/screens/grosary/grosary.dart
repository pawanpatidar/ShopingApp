import 'package:flutter/material.dart';
import 'package:shoping_app/models/fruits_model.dart';
import 'package:shoping_app/screens/cart/ui/cart_list.dart';
import 'package:shoping_app/screens/favorite/ui/favorite.dart';
import 'package:shoping_app/screens/grosary/bloc/grosary_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GrosaryPage extends StatefulWidget {
  const GrosaryPage({super.key});

  @override
  State<GrosaryPage> createState() => _GrosaryPageState();
}

class _GrosaryPageState extends State<GrosaryPage> {
  final GrosaryBloc grosaryBloc = GrosaryBloc();

  @override
  void initState() {
    // TODO: implement initState
    grosaryBloc.add(InitialLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GrosaryBloc, GrosaryState>(
      bloc: grosaryBloc,
      listener: (context, state) {
        if (state is ProductCartNavigationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartList()));
        } else if (state is ProductFavoriteNavigationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FavoriteItems()));
        } else if (state is ProductItemAddToCartClickedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Poduct added to cart")));
        } else if (state is ProductItemFavoriteClickedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item added to wish list")));
        }
      },
      listenWhen: (previous, current) => current is GrosaryActionState,
      buildWhen: (previous, current) => current is! GrosaryActionState,
      builder: (context, state) {
        GrosarySuccessState? grosarySuccessState;
        if (state.runtimeType == GrosarySuccessState) {
          grosarySuccessState = state as GrosarySuccessState;
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text("Products"),
              backgroundColor: Colors.teal,
              actions: [
                IconButton(
                    onPressed: () {
                      grosaryBloc.add(ProductWishListNavigationEvent());
                    },
                    icon: const Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      grosaryBloc.add(ProductCartListNavigationEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined))
              ],
            ),
            body: (state.runtimeType == GrosaryInitialState)
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ))
                : state.runtimeType == GrosarySuccessState
                    ? Container(
                        color: Colors.white70,
                        height: MediaQuery.sizeOf(context).height,
                        width: double.infinity,
                        margin: const EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: grosarySuccessState!.fruits.length,
                          itemBuilder: (context, index) {
                            FruitsModel model =
                                grosarySuccessState!.fruits.elementAt(index);
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  side: BorderSide(
                                      width: 1, color: Colors.black26)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      model.imageUrl!))),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: const BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Text(
                                              "${model.discount} off",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "${model.name}",
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "${model.description}",
                                        style: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "Rs- ${model.price!}/Kg",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  grosaryBloc.add(
                                                      ProductWishItemClickedEvent(
                                                          item: model));
                                                },
                                                icon: const Icon(
                                                  Icons.favorite_border,
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  grosaryBloc.add(
                                                      ProductAddToCartClickEvent(
                                                          item: model));
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .yellow.shade100,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: const Text(
                                                    "Add To Cart",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ))
                                          ],
                                        )
                                      ],
                                    )
                                  ]),
                            );
                          },
                        ),
                      )
                    : state.runtimeType == GrosaryErrorState
                        ? const Center(child: Text("Someting went wrong!! "))
                        : const Center(child: Text("No Data")));
      },
    );
  }
}
