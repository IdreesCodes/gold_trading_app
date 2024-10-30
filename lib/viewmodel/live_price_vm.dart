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



  List<double> goldList=[];
  List<double> silverList=[];
  List<double> platinumList=[];
  List<double> palladiumList=[];
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void init() {
   _startLivePriceUpdates();
  }


  Future<void> _startLivePriceUpdates() async {
    await callGetLivePricesApi();
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) async {
      await callGetLivePricesApi();
    });
  }

  Future<void>  callGetLivePricesApi() async {

    try {
      dynamic response = await DioClient.instance.get(APIConstants.getLivePrices);
      print("the response is" );
      response = jsonDecode(response.toString());

      livePriceModel=LivePriceModel.fromJson(response);
      goldList.add(double.parse(livePriceModel?.livePrices?[0].buyOzPrice.toString()??''));
      silverList.add(double.parse(livePriceModel?.livePrices?[1].buyOzPrice.toString()??''));
      platinumList.add(double.parse(livePriceModel?.livePrices?[2].buyOzPrice.toString()??''));
      palladiumList.add(double.parse(livePriceModel?.livePrices?[3].buyOzPrice.toString()??''));

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

  void stopLivePriceUpdates() {
    _timer?.cancel();
  }

}
