import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/item.dart';
import 'favourite_states.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItems: [], search: ''));

  void addItem() {
    List<Item> item = [
      Item(name: 'MacBook1', id: 1, favourite: true),
      Item(name: 'MacBook2', id: 2, favourite: false),
      Item(name: 'MacBook3', id: 3, favourite: false),
      Item(name: 'MacBook4', id: 4, favourite: true),
      Item(name: 'MacBook5', id: 5, favourite: false),
      Item(name: 'MacBook6', id: 6, favourite: true),
    ];
    state = state.copyWith(
      allItems: item.toList(),
      filteredItems: item.toList(),
    );
  }

  void filterList(String search) {
    state = state.copyWith(filteredItems: _filterItems(state.allItems, search));
  }

  void favourite(String option) {
    state = state.copyWith(
      filteredItems: _favouriteItems(state.allItems, option),
    );
  }

  List<Item> _favouriteItems(List<Item> items, String option) {
    if (option == 'All') {
      return items;
    }
    return items.where((item) => item.favourite == true).toList();
  }

  List<Item> _filterItems(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
