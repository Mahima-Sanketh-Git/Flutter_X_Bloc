part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomePressCartState extends HomeState {}

final class HomePressWishListState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {
  final List<ProducModel> productModel;

  HomeLoadedSuccessState({required this.productModel});
}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {}

final class HomePressCartNavigateState extends HomeActionState {}

final class HomePressWishListNavigateState extends HomeActionState {}

final class HomePressCartSuccessState extends HomeActionState {}

final class HomePressWishListSuccessState extends HomeActionState {}
