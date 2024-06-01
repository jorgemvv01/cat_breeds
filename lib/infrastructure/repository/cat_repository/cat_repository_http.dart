import 'dart:convert';

import 'package:cat_breeds/domain/cat/interface/i_cat.dart';
import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/utils/api/api.dart';
import 'package:http/http.dart' as http;

class CatRepositoryHTTP extends ICat{

  @override
  Future<List<Cat>> getAllBreeds() async{
    List<Cat> allCatsByBreed = [];
    try{
      final url = Uri.https(Api.getAPIBase(), Api.allBreeds, {});
      final response = await http.get(
        url,
        headers: {
          'Content-Type' : 'application/json',
          'x-api-key' : 'bda53789-d59e-46cd-9bc4-2936630fde39'
        }
      ).timeout(const Duration(milliseconds: Api.timeout));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        allCatsByBreed = List<Cat>.from(
          body.map((x) => Cat.fromJson(x))
        );
        return allCatsByBreed;
      }
    }catch(e){
      print(e.toString());
    }
    return allCatsByBreed;
  }

  @override
  Future<List<Cat>> searchBreeds(String searchText) async{
    List<Cat> allCatsByBreed = [];
    try{
      final url = Uri.https(Api.getAPIBase(), Api.searchBreeds, {
        'q' : searchText
      });
      final response = await http.get(
        url,
        headers: {
          'Content-Type' : 'application/json',
          'x-api-key' : 'bda53789-d59e-46cd-9bc4-2936630fde39'
        }
      ).timeout(const Duration(milliseconds: Api.timeout));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        allCatsByBreed = List<Cat>.from(
          body.map((x) => Cat.fromJson(x))
        );
        return allCatsByBreed;
      }
    }catch(e){
      print(e.toString());
    }
    return allCatsByBreed;
  }
}