part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

final class CartLoadedState extends CartState {
  final List<ProducModel> productModel;

  CartLoadedState({required this.productModel});
}
