import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tripapp/models/tripmodels/tripgetby%C4%B1dmodel.dart';

import '../models/tripmodels/tripgetmodel.dart';

class TripService{
  final url = "https://10.0.2.2:7289/api/Trip/List";
  
  Future<TripModel?> fetchTrip() async{
    try{
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        var result = TripModel.fromJson(jsonDecode(response.body));
        return result;
    }else{
      print(response.statusCode);
    }
    }catch(e){print(e.toString());}
    return null;
  }

  Future<TripModel?> fetchTripWithSearch({required String search}) async{
    const String baseurl = 'https://10.0.2.2:7289/api/Trip/CategoryList?search=';
    try{
      var response = await http.get(Uri.parse(baseurl+search));
      if(response.statusCode == 200){
        var result = TripModel.fromJson(jsonDecode(response.body));
        log(response.body);
        return result;
      }else{
        print(response.statusCode);
      }
    }catch(e){print(e.toString());}
    return null;
  }

  Future<TripGetById?> fetchTripGetById({required int id}) async{
    const String url = 'https://10.0.2.2:7289/api/Trip/List/';
    try{
      var response = await http.get(Uri.parse(url+'$id'));
      if(response.statusCode == 200){
        var result = TripGetById.fromJson(jsonDecode(response.body));
        log(response.body);
        return result;
      }else{print(response.statusCode);}
    }catch(e){print(e.toString());}
    return null;
  }

  Future<TripModel?> fetchFavourite({required int id}) async{
    const String url = 'https://10.0.2.2:7289/GetByIdWithTrip?id=';
    try{
      var response = await http.get(Uri.parse(url+'$id'));
      if(response.statusCode == 200){
        var result = TripModel.fromJson(jsonDecode(response.body));
        log(response.body);
        return result;
      }

    }catch(e){print(e.toString());}
  }
  
  Future<TripModel?> fetchBasket({required int id}) async{
    const String url = 'https://10.0.2.2:7289/GetById?id=';
    try{
      var response = await http.get(Uri.parse(url+'$id'));
      if(response.statusCode == 200){
        var result = TripModel.fromJson(jsonDecode(response.body));
        log(response.body);
        return result;
      }
    }catch(e){print(e.toString());}
  }
}