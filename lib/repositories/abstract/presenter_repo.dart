
import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class PresenterRepo {
  Stream<List<PresenterModel>> presenters();
  Stream<List<PresenterModel>>? presentersList();
  // Future<List<AudioModel>> fetchPosts(int page); 
}
