import 'package:cat_breeds/domain/cat/interface/i_cat.dart';
import 'package:cat_breeds/domain/cat/model/cat.dart';

class CatService {
  final ICat iCat;

  CatService({
    required this.iCat
  });

  Future<List<Cat>> getAllBreeds() async {
    return await iCat.getAllBreeds();
  }

  Future<List<Cat>> searchBreeds(String searchText) async{
    return await iCat.searchBreeds(searchText);
  }
}