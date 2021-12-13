import 'package:hooks_riverpod/hooks_riverpod.dart';

final sampleRepositoryProvider = Provider((ref) => SampleRepositoryImpl());

abstract class SampleRepository {
  Future<List<String>> getData();
}

class SampleRepositoryImpl extends SampleRepository {
  @override
  Future<List<String>> getData() => Future<List<String>>.value([
        "フシギダネ",
        "フシギソウ",
        "フシギバナ",
        "ヒトカゲ",
        "リザード",
        "リザードン",
        "ゼニガメ",
        "カメール",
        "カメックス"
      ]);
}
