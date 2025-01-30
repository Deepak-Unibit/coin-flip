import 'package:flip_coin/models/profile.model.dart';
import 'package:get/get.dart';

class DataService extends GetxController {
  Rx<ProfileData> profileData = ProfileData().obs;

}