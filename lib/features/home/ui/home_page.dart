import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/cart/ui/cart_page.dart';
import 'package:myapp/features/home/bloc/home_bloc.dart';
import 'package:myapp/features/home/model/product_model.dart';
import 'package:myapp/features/home/ui/product_tile.dart';
import 'package:myapp/features/wishlist/ui/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HomePressCartNavigateState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomePressWishListNavigateState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const WishListPage(),
            ),
          );
        } else if (state is HomePressCartSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        } else if (state is HomePressWishListSuccessState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final susccesstate = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.blue,
                title: const Text(
                  "My Shop",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomePressCartNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.favorite,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomePressWishListNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.shopping_basket,
                    ),
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: susccesstate.productModel.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    homeBloc: homeBloc,
                    producModel: susccesstate.productModel[index],
                  );
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
