import 'package:cat_breeds/domain/cat/model/cat.dart';

abstract class ICat {
  Future<List<Cat>> getAllBreeds();
  Future<List<Cat>> searchBreeds(String searchText);
}