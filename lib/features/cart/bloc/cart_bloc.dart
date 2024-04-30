import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/card_data.dart';
import 'package:myapp/features/home/model/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(_cartInitialEvent);
    on<CartRemoveEvent>(_cartRemoveEvent);
  }

  FutureOr<void> _cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartLoadedState(productModel: cartData));
  }

  FutureOr<void> _cartRemoveEvent(
      CartRemoveEvent event, Emitter<CartState> emit) {
    cartData.remove(event.producModel);
    emit(CartLoadedState(productModel: cartData));
  }
}
