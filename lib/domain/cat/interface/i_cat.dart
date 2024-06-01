import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/domain/cat/model/cat_image.dart';

abstract class ICat {
  Future<List<Cat>> getAllBreeds();
  Future<CatImage?> getCatImage(String referenceImage);
  Future<List<Cat>> searchBreeds(String searchText);
}