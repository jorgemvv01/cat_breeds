import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/domain/cat/service/cat_service.dart';
import 'package:cat_breeds/infrastructure/repository/cat_repository/cat_repository_http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
FocusNode textFocus(TextFocusRef ref) {
  return FocusNode();
}

@Riverpod(keepAlive: true)
TextEditingController textController(TextControllerRef ref) {
  return TextEditingController();
}

@Riverpod(keepAlive: true)
Future<List<Cat>> cat(CatRef ref) async{
  final searchText = ref.watch(searchTextProvider);
  final catServie = CatService(iCat: CatRepositoryHTTP());
  return searchText.trim().isEmpty
   ? await catServie.getAllBreeds()
   : await catServie.searchBreeds(searchText);
}

@Riverpod(keepAlive: true)
class SearchText extends _$SearchText {
  @override
  String build() => '';

  void search(String searchText){
    state = searchText.trim();
  }
}