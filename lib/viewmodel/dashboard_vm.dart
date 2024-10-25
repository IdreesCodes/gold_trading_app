import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../managers/dio_client.dart';
import '../utils/api_constants.dart';

class DashboardViewModel extends ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
      _loading = value;
      notifyListeners();
  }

  init() async {
    dynamic body = {};
    body = FormData.fromMap(body);
    try {
      // dynamic response = await DioClient.instance.post(APIConstants., data: body);
      // response = jsonDecode(response.toString());
    } catch (e) {
      if (kDebugMode) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          fontSize: 13.0,
        );
      }
    } finally {}
  }


}
