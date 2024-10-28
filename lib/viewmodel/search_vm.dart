import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fine_gold_flutter/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../managers/dio_client.dart';
import '../utils/api_constants.dart';

class SearchViewModel extends ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;
  ProductModel? productModel;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  init() async {
    try {
      dynamic response = await DioClient.instance.get(APIConstants.getProducts);
      response = jsonDecode(response.toString());
      productModel=ProductModel.fromJson(response);
      debugPrint("${productModel?.products?.length}");
    } catch (e) {
      if (kDebugMode) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          fontSize: 13.0,
        );
      }
    } finally {
      notifyListeners();
    }
  }

}
