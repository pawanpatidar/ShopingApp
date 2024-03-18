import 'package:flutter/material.dart';
import 'package:shoping_app/models/calegory_model.dart';
import 'package:shoping_app/screens/category/bloc/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CategoryPage> {
  CategoryBloc categoryBloc = CategoryBloc();
  @override
  void initState() {
    // TODO: implement initState
    categoryBloc.add(InitialLoadCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      bloc: categoryBloc,
      listenWhen: (previous, current) => current is CategoryActionState,
      buildWhen: (previous, current) => current is! CategoryActionState,
      builder: (context, state) {
        CatagorySuccessState? successState;
        if (state.runtimeType == CatagorySuccessState) {
          successState = state as CatagorySuccessState;
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text("Categories"),
              backgroundColor: Colors.teal,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined))
              ],
              leading: const DrawerButton(),
            ),
            body: (state.runtimeType == CategoryInitial)
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ))
                : state.runtimeType == CatagorySuccessState
                    ? Column(
                        children: [
                          Container(
                            height: 120,
                            child: ListView.builder(
                                itemCount: 7,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.green.shade100,
                                              Colors.blue.shade100
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 70,
                                            width: 60,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://cdn.iconscout.com/icon/premium/png-256-thumb/deal-7-285433.png")))),
                                        const Text("deal"),
                                      ],
                                    ),
                                  );
                                })),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: successState!.catagories.length,
                                itemBuilder: (context, index) {
                                  CategoryModel model =
                                      successState!.catagories.elementAt(index);
                                  return Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${model.categoryName}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                          GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(
                                                      parent: ScrollPhysics()),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                              itemCount:
                                                  model.subcategories!.length,
                                              itemBuilder: (context, index1) {
                                                Subcategories subcategories =
                                                    model.subcategories!
                                                        .elementAt(index1);
                                                return Card(
                                                  clipBehavior: Clip.antiAlias,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4)),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Colors
                                                                  .black26)),
                                                  child: Stack(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  subcategories
                                                                      .imageUrl!))),
                                                    ),
                                                    Container(
                                                        color: Colors.black
                                                            .withOpacity(0.5)),
                                                    Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${subcategories.subcategoryName}",
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16),
                                                          ),
                                                          const Text(
                                                            "24 product",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      color:
                                                          Colors.green.shade100,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: const Text(
                                                        "Up to 30% off",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    )
                                                  ]),
                                                );
                                              })
                                        ]),
                                  );
                                }),
                          ),
                        ],
                      )
                    : const Center(child: Text("No Data")));
      },
    );
  }
}
