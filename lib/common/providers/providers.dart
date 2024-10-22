import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/dashboard_viewmodel.dart';

final dashBoardProvider = ChangeNotifierProvider.autoDispose<DashboardViewModel>((ref) {
  return DashboardViewModel();
});

