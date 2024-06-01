import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/domain/cat/model/cat_image.dart';
import 'package:cat_breeds/domain/cat/service/cat_service.dart';
import 'package:cat_breeds/infrastructure/repository/cat_repository/cat_repository_http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_provider.g.dart';


//Service
@riverpod
CatService catService(CatServiceRef ref) {
  return CatService(iCat: CatRepositoryHTTP());
}

//Focus
@Riverpod(keepAlive: true)
FocusNode textFocus(TextFocusRef ref) {
  return FocusNode();
}

//TextController
@Riverpod(keepAlive: true)
TextEditingController textController(TextControllerRef ref) {
  return TextEditingController();
}


//Get cats
@Riverpod(keepAlive: true)
Future<List<Cat>> cat(CatRef ref) async{
  final searchText = ref.watch(searchTextProvider);
  final catService = ref.read(catServiceProvider);
  return searchText.trim().isEmpty
   ? await catService.getAllBreeds()
   : await catService.searchBreeds(searchText);
}

//Search text
@Riverpod(keepAlive: true)
class SearchText extends _$SearchText {
  @override
  String build() => '';

  void search(String searchText){
    state = searchText.trim();
  }
}

//Cat image
@Riverpod(keepAlive: true)
Future<CatImage?> catImage(CatImageRef ref, refrenceImageId) async{
  final catService = ref.read(catServiceProvider);
  if (ref.read(catProvider).hasValue){
    return await catService.getCatImage(
      refrenceImageId
    );
  }
  return null;
}