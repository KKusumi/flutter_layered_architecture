import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture/data/repository/sample_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelNotifierProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._reader);

  final Reader _reader;
  late final SampleRepository _repository = _reader(sampleRepositoryProvider);

  List<String>? _data;

  List<String>? get data => _data;

  Future<void> getData() async {
    return _repository.getData().then((value) {
      _data = value;
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
