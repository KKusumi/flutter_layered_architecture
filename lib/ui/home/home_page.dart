import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layered_architecture/ui/home/home_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// WidgetRefからViewModelを取得するために、StatelessWidgetではなくHookConsumerWidgetを継承する。
class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // dataをselectするためにViewModelをWidgetRefから取得する。
    // viewModel取得時にViewの更新は必要ないのでreadを使う。
    final viewModel = ref.read(homeViewModelNotifierProvider);
    // watch: Providerに登録されているインスタンスが持つ値を監視する。
    // select: Providerに登録されているインスタンスを取得する。(Provider経由じゃないとwatchできない)
    final data =
        ref.watch(homeViewModelNotifierProvider.select((value) => value.data));

    // useEffect: レンダリング完了時にgetDataが実行される。
    useEffect(() {
      viewModel.getData();
      return;
    }, []);

    return data == null
        ? const SizedBox()
        : ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Text(
                  data[index], // dataはgetData実行で更新されて、自動的にViewの更新が走る。
                  textAlign: TextAlign.left,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 1,
                color: Colors.black,
              );
            },
          );
  }
}
