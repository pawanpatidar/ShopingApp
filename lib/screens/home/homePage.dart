import 'package:flutter/material.dart';
import 'package:shoping_app/models/fruits_model.dart';
import 'package:shoping_app/screens/cart/ui/cart_list.dart';
import 'package:shoping_app/screens/favorite/ui/favorite.dart';
import 'package:shoping_app/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/screens/home/botom_navigation.dart';
import '../drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(InitialLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
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
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Products"),
              backgroundColor: Colors.teal.shade200,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(ProductWishListNavigationEvent());
                    },
                    icon: const Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(ProductCartListNavigationEvent());
                    },
                    icon: const Icon(Icons.shopping_cart))
              ],
            ),
            drawer: const DrawerManu(),
            bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: MyBottomNavigation(
                  onTap: (value) {},
                )),
            body: Container());
      },
    );
  }
}
