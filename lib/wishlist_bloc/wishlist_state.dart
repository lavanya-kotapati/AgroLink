import 'package:equatable/equatable.dart';

class WishlistState extends Equatable {
  final List<Map<String, dynamic>> wishlistItems;

  const WishlistState({required this.wishlistItems});

  factory WishlistState.initial() {
    return const WishlistState(wishlistItems: []);
  }

  WishlistState copyWith({List<Map<String, dynamic>>? wishlistItems}) {
    return WishlistState(wishlistItems: wishlistItems ?? this.wishlistItems);
  }

  @override
  List<Object> get props => [wishlistItems];
}
