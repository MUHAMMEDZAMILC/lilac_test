import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:japx/japx.dart';
import 'package:lilac_test/core/contants/app_constants.dart';
import 'package:lilac_test/core/dynamic/app_variables.dart';


enum Method { get, post, put, delete }

class Api {
  static String baseUrl = AppConstants.baseUrl;
  static const _headers = {'Content-Type': 'application/vnd.api+json'}; // Changed for JSON:API
  static var barearheader = {
    'Content-Type': 'application/vnd.api+json', // Changed for JSON:API
    'Authorization': 'Bearer ${AppVariables.authtoken}',
  };

  static Future? call(BuildContext context, {
    required String endPoint, 
    required Method method, 
    Object? body,
    Map<String, String>? header,
  }) async {
    try {
      final http.Response response;
      log("${baseUrl + endPoint} ($method)\n$body");

      
      String? encodedBody;
      if (body != null) {
         encodedBody = json.encode(body);
      }

      // REST API METHOD
      switch (method) {
        case Method.get:
          String url = baseUrl + endPoint;
          response = await http.get(Uri.parse(url), headers: header ?? _headers);
          log(response.body);

          try {
            final data = Japx.decode(json.decode(response.body));
            return data;
          } catch (err) {
            return {'status': false, 'message': 'Something went wrong'};
          }

        case Method.post:
          response = await http.post(
            Uri.parse(baseUrl + endPoint),
            body: encodedBody,
            headers: header ?? _headers,
          );
          log(response.body.toString());
          try {
            final data = Japx.decode(json.decode(response.body));
            return data;
          } catch (err) {
            try {
              final data = json.decode(response.body);
            return data;
            } catch (e) {
               return {'status': false, 'message': 'Something went wrong'};
            }
           
          }

        case Method.put:
          response = await http.put(
            Uri.parse(baseUrl + endPoint),
            body: encodedBody,
            headers: header ?? _headers,
          );
          log(response.body);
          try {
            final data = Japx.decode(json.decode(response.body));
            return data;
          } catch (err) {
            return {'status': false, 'message': 'Something went wrong'};
          }
          
        default:
          return {'status': false, 'message': 'Invalid method'};
      }
    } on SocketException {
      return {'status': false, 'message': 'No Internet Connection'};
    } catch (e) {
      debugPrint("$e");
      return {'status': false, 'message': 'Something went wrong'};
    }
  }
}