import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fine_gold_flutter/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../managers/dio_client.dart';
import '../utils/api_constants.dart';

class SearchViewModel extends ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;
  TextEditingController searchController =TextEditingController();

  ProductModel? productModel;

  String filterStockStatus = '';
  TextEditingController filterMaxPriceController =TextEditingController();
  TextEditingController filterMinPriceController =TextEditingController();

  SfRangeValues values = const SfRangeValues(0.0, 999999.0);

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  init() async {
    try {
      dynamic response = await DioClient.instance.get("${APIConstants.getProducts}?per_page=56");
      response = jsonDecode(response.toString());
      productModel=ProductModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          fontSize: 13.0,
        );
        print("Error: $e");
      }
    } finally {
      notifyListeners();
    }
  }

  List<Products> getSearchProducts(){
    return productModel!.products!.where((product) {
      return
      filterStockStatus==""&&filterMaxPriceController.text==""&&filterMaxPriceController.text==""?true:
      filterStockStatus==""&&filterMaxPriceController.text!=""&&filterMaxPriceController.text!=""?double.parse(product.price.toString())>double.parse(filterMinPriceController.text.toString())&&double.parse(product.price.toString())<double.parse(filterMaxPriceController.text.toString()):
      filterStockStatus!=""&&filterMaxPriceController.text==""&&filterMaxPriceController.text==""?product.stockStatus==filterStockStatus:product.stockStatus==filterStockStatus&&double.parse(product.price.toString())>double.parse(filterMinPriceController.text.toString())&&double.parse(product.price.toString())<double.parse(filterMaxPriceController.text.toString());
    }).toList();
  }
  void setFilterValue({String? stockStatus}){

    if(stockStatus!=null){
      filterStockStatus=stockStatus;
    }else{
      values=SfRangeValues( double.parse(filterMinPriceController.text), double.parse(filterMaxPriceController.text));
    }
    notifyListeners();
  }

  removeFilter(){
    searchController.text='';
    filterMinPriceController.text='';
    filterMaxPriceController.text='';
    filterStockStatus='';
    values = const SfRangeValues(0.0, 999999.0);
  }

}
