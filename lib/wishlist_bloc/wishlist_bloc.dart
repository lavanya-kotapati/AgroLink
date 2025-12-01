import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_idea/wishlist_bloc/wishlist_event.dart';
import 'package:make_my_idea/wishlist_bloc/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState.initial()) {
    on<AddToWishlistEvent>(_onAddToWishlist);
    on<RemoveFromWishlistEvent>(_onRemoveFromWishlist);
  }

  void _onAddToWishlist(
    AddToWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    final currentItems = List<Map<String, dynamic>>.from(state.wishlistItems);
    
    // Check if item already exists (by name or unique identifier)
    // final exists = currentItems.any((item) => item['name'] == event.productData['name']);
    
    // if (!exists) {
      currentItems.add(event.productData);
      emit(state.copyWith(wishlistItems: currentItems));
    // }
  }

  void _onRemoveFromWishlist(
    RemoveFromWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    final currentItems = List<Map<String, dynamic>>.from(state.wishlistItems);
    currentItems.removeWhere((item) => item['name'] == event.productData['name']);
    emit(state.copyWith(wishlistItems: currentItems));
  }
}