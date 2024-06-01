

import 'package:cat_breeds/utils/api/enviroments.dart';

class Api {

  static const int timeout = 15000;
  static const Enviroments env = Enviroments.prod;

  static const String version = 'v1';

  //endpoint
  static const String allBreeds = '/$version/breeds';
  static const String searchBreeds = '/$version/breeds/search';

  //image
  static const String image = 'https://cdn2.thecatapi.com/images/';

  static String getAPIBase(){
    switch (env) {
      case Enviroments.dev:
        return 'api.thecatapi.com';
      case Enviroments.qa:
        return 'api.thecatapi.com';
      case Enviroments.prod:
        return 'api.thecatapi.com';
      default:
        return 'api.thecatapi.com';
    }
  }
  
}