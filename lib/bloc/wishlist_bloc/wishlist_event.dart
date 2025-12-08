import 'package:equatable/equatable.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class AddToWishlistEvent extends WishlistEvent {
  final Map<String, dynamic> productData;

  const AddToWishlistEvent({required this.productData});

  @override
  List<Object> get props => [productData];
}

class RemoveFromWishlistEvent extends WishlistEvent {
  final Map<String, dynamic> productData;

  const RemoveFromWishlistEvent({required this.productData});

  @override
  List<Object> get props => [productData];
}