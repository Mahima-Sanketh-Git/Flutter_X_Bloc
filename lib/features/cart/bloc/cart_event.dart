part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitialEvent extends CartEvent {}

final class CartRemoveEvent extends CartEvent {
  final ProducModel producModel;

  CartRemoveEvent({required this.producModel});
}
