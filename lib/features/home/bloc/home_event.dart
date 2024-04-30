part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

final class HomePressCartButtonEvnt extends HomeEvent {
  final ProducModel producModel;

  HomePressCartButtonEvnt({required this.producModel});
}

final class HomePressWishListButtonEvent extends HomeEvent {
  final ProducModel producModel;

  HomePressWishListButtonEvent({required this.producModel});
}

final class HomePressCartNavigateEvent extends HomeEvent {}

final class HomePressWishListNavigateEvent extends HomeEvent {}
