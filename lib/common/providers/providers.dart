import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/dashboard_vm.dart';
import '../../viewmodel/search_vm.dart';

final dashBoardProvider = ChangeNotifierProvider.autoDispose<DashboardViewModel>((ref) {
  return DashboardViewModel();
});

final productProvider = ChangeNotifierProvider<SearchViewModel>((ref) {
  return SearchViewModel();
});

final livePriceProvider = ChangeNotifierProvider<DashboardViewModel>((ref) {
  return DashboardViewModel();
});

