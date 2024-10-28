import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fine_gold_flutter/model/live_price_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../managers/dio_client.dart';
import '../utils/api_constants.dart';

class LivePriceViewModel extends ChangeNotifier {

  Timer? _timer;
  bool _loading = false;
  bool get loading => _loading;

  LivePriceModel? livePriceModel;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void init() {
    _startLivePriceUpdates();
  }

  Future<void> _startLivePriceUpdates() async {
    // Call API immediately the first time
    await callGetLivePricesApi();

    // Start timer for continuous calls
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) async {
      await callGetLivePricesApi();
    });
  }

  Future<void>  callGetLivePricesApi() async {
    dynamic body = {};
    body = FormData.fromMap(body);
    try {
      dynamic response = await DioClient.instance.post(APIConstants.getLivePrices, data: body);
      response = jsonDecode(response.toString());
      livePriceModel=LivePriceModel.fromJson(response);
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

  // To stop the updates if needed
  void stopLivePriceUpdates() {
    _timer?.cancel();
  }

}
