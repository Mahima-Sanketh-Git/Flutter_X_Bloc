import 'dart:js_interop';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/card_data.dart';
import 'package:myapp/data/grocery_item.dart';
import 'package:myapp/data/wishlist_data.dart';
import 'package:myapp/features/home/model/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_homeInitial);
    on<HomePressCartButtonEvnt>(_homePressCartButtonEvnt);
    on<HomePressWishListButtonEvent>(_homePressWishListButtonEvent);
    on<HomePressCartNavigateEvent>(_homePressCartNavigateEvent);
    on<HomePressWishListNavigateEvent>(_homePressWishListNavigateEvent);
  }
  void _homeInitial(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        productModel: GroceryData.groceryProducts
            .map(
              (e) => ProducModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  void _homePressCartButtonEvnt(
      HomePressCartButtonEvnt event, Emitter<HomeState> emit) {
    print("HomePressCartButtonEvnt");
    cartData.add(event.producModel);
    emit(HomePressCartSuccessState());
  }

  void _homePressWishListButtonEvent(
      HomePressWishListButtonEvent event, Emitter<HomeState> emit) {
    print("HomePressWishListButtonEvent");
    wishlistData.add(event.producModel);
    emit(HomePressWishListSuccessState());
  }

  void _homePressCartNavigateEvent(
      HomePressCartNavigateEvent event, Emitter<HomeState> emit) {
    print("HomePressCartNavigateEvent");
    emit(HomePressCartNavigateState());
  }

  void _homePressWishListNavigateEvent(
      HomePressWishListNavigateEvent event, Emitter<HomeState> emit) {
    print("HomePressWishListNavigateEvent");
    emit(HomePressWishListNavigateState());
  }
}
