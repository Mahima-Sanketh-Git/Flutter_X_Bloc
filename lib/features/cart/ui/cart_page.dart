import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/cart/bloc/cart_bloc.dart';
import 'package:myapp/features/cart/ui/cart_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      buildWhen: (previous, current) => current is! CartActionState,
      listenWhen: (previous, current) => current is CartActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartLoadedState:
            final loaded = state as CartLoadedState;
            return Scaffold(
              body: ListView.builder(
                itemCount: loaded.productModel.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    homeBloc: cartBloc,
                    producModel: loaded.productModel[index],
                  );
                },
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
