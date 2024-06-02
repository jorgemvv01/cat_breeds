import 'dart:convert';

import 'package:cat_breeds/domain/cat/interface/i_cat.dart';
import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/domain/cat/model/cat_image.dart';
import 'package:cat_breeds/main.dart';
import 'package:cat_breeds/utils/api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class CatRepositoryHTTP extends ICat{

  @override
  Future<List<Cat>> getAllBreeds() async{
    
    List<Cat> allCatsByBreed = [];
    try{
      final url = Uri.https(Api.getAPIBase(), Api.allBreeds, {});
      storage = await getStorage();
      String apiKey = await storage?.read(key: 'api-key') ?? '';
      final response = await http.get(
        url,
        headers: {
          'Content-Type' : 'application/json',
          'x-api-key' : apiKey
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
      debugPrint('ERROR CAT REPOSITORY: $e');
    }
    return allCatsByBreed;
  }

  @override
  Future<CatImage?> getCatImage(String referenceImage) async{
    try{
      final url = Uri.https(Api.getAPIBase(), '${Api.images}$referenceImage', {});
      storage = await getStorage();
      String apiKey = await storage?.read(key: 'api-key') ?? '';
      final response = await http.get(
        url,
        headers: {
          'Content-Type' : 'application/json',
          'x-api-key' : apiKey
        }
      ).timeout(const Duration(milliseconds: Api.timeout));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        final catImage = CatImage.fromJson(body);
        return catImage;
      }
    }catch(e){
      debugPrint('ERROR CAT REPOSITORY: $e');
    }
    return null;
  }

  @override
  Future<List<Cat>> searchBreeds(String searchText) async{
    List<Cat> allCatsByBreed = [];
    try{
      final url = Uri.https(Api.getAPIBase(), Api.searchBreeds, {
        'q' : searchText
      });
      storage = await getStorage();
      String apiKey = await storage?.read(key: 'api-key') ?? '';
      final response = await http.get(
        url,
        headers: {
          'Content-Type' : 'application/json',
          'x-api-key' : apiKey
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
      debugPrint('ERROR CAT REPOSITORY: $e');
    }
    return allCatsByBreed;
  }
}