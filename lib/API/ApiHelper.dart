import 'package:dio/dio.dart';


class ApiHelper{
ApiHelper._();
static ApiHelper helper= ApiHelper._();
Dio dio=Dio();
////////Get All Categories///////////
Future<Map<dynamic,dynamic>> getAllCategories() async {
  String url = 'http://www.themealdb.com/api/json/v1/1/categories.php';
  Response response = await dio.get(url);
  Map<dynamic,dynamic> categories = response.data;
  return categories;
}

///////Get All meals of Category name//////////////
  Future<Map<dynamic,dynamic>> getCategoryProducts(String categoryName) async {
    String url = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName';
    Response response = await dio.get(url);
    Map<dynamic,dynamic> products = response.data;
    return products;
  }

  /////////////////////Get Specific Meal/////////////////////////////
  Future<Map<dynamic,dynamic>> getSpecificProduct(String id) async {
    String url = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id';
    Response response = await dio.get(url);
    return response.data;
  }
////////////////////////////////////////////////////

////////////////////////////////////////////////////
  Future<Map<dynamic,dynamic>> getMealsByFirstLetter(String letter)async{
  String url = 'https://www.themealdb.com/api/json/v1/1/search.php?f=$letter';
  Response response = await dio.get(url);
  Map<dynamic,dynamic> products = response.data;
  return products;
}
////////////////////////////////////////////////////
}
