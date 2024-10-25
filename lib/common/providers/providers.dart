import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/dashboard_vm.dart';

final dashBoardProvider = ChangeNotifierProvider.autoDispose<DashboardViewModel>((ref) {
  return DashboardViewModel();
});

