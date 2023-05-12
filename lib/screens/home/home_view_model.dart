import 'package:yolo/data/remote/model/sponsors_list_model.dart';
import 'package:yolo/data/repo/auth_repo.dart';
import 'package:yolo/utils/view_model.dart';

class HomeViewModel extends ViewModel {
  List<AllSponsors> sponsors = [];
  void sponsorsListReq() {
    callApi(() async {
      final response = await RequestRepo.sponsorsListCall();
      if (response.status == 200) {
        var data = SponsorsListModel.fromJson(response.data);
        sponsors.clear();
        notifyListeners();
        sponsors.addAll(data.allSponsors!);
        notifyListeners();
      }
    });
  }

  void refersGet() {
    callApi(() async {
      final response = await RequestRepo.refersCall();
      if (response.status == 200) {
        notifyListeners();
        notifyListeners();
      }
    });
  }
}
