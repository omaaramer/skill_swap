import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:skill_swap/data/models/post_model.dart';

void saveDataOnHive(RxList<PostModel> posts, String boxName) {
  var postsBox = Hive.box(boxName);
  postsBox.addAll(posts);
}
