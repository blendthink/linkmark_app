import 'package:linkmark_app/data/model/link.dart';

abstract class LinksDataSource {
  Future<Map<String, Link>> getLinks();
}
