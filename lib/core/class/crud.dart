import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:realestate/core/class/stutusconntection.dart';

import '../functions/checkinternet.dart';


class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
   
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
          print(response.statusCode) ; 

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody) ; 
          
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
     
  }
  /////////////////////////////////////////////////
  //////////////GetData////////////////////////////
  /////////////////////////////////////////////////
  Future<Either<StatusRequest, Map<String, dynamic>>> getData(
      String linkurl, @required String Token) async {
    Map<String, String> header = {};
    if (Token != null) {
      header.addAll({"Authorization": "Token ${Token}"});
    }

    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl), headers: header);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> getdataasmap(
      String linkurl, @required String Token) async {
    Map<String, String> header = {};
    if (Token != null) {
      header.addAll({"authorization": "token ${Token}"});
    }

    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl), headers: header);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
