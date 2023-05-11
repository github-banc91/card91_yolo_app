import 'package:yolo/data/remote/model/sponsors_list_model.dart';
import 'package:yolo/data/repo/auth_repo.dart';
import 'package:yolo/utils/view_model.dart';

class DashboardViewModel extends ViewModel {
  void sponsorsListReq() {
    final res = RequestRepo.sponsorsListCall();
    SponsorsListModel.fromJson(res);
  }
}
