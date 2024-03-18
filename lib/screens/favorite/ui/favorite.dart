import 'package:flutter/material.dart';
import 'package:shoping_app/data/favorite_fruits.dart';
import 'package:shoping_app/models/fruits_model.dart';
import 'package:shoping_app/screens/favorite/bloc/favorite_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteItems extends StatefulWidget {
  const FavoriteItems({super.key});

  @override
  State<FavoriteItems> createState() => _FavoriteItemsState();
}

class _FavoriteItemsState extends State<FavoriteItems> {
  FavoriteBloc favoriteBloc = new FavoriteBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Favorite"),
          centerTitle: false,
        ),
        body: BlocConsumer<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          bloc: favoriteBloc,
          builder: (context, state) {
            return Container(
              color: Colors.white70,
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: favoritList.length,
                itemBuilder: (context, index) {
                  FruitsModel model = favoritList.elementAt(index);
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(width: 1, color: Colors.black26)),
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
                                        image: NetworkImage(model.imageUrl!))),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Text(
                                    "${model.discount} off",
                                    style: const TextStyle(color: Colors.white),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Rs- ${model.price!}/Kg",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black87),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        // favoriteBloc.add(
                                        //     ProductWishItemClickedEvent(
                                        //         item: model));
                                      },
                                      icon: const Icon(
                                        Icons.favorite_border,
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        // homeBloc.add(
                                        //     ProductAddToCartClickEvent(
                                        //         item: model));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.yellow.shade100,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: const Text(
                                          "Add To Cart",
                                          style: TextStyle(fontSize: 12),
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
            );
          },
        ));
  }
}
