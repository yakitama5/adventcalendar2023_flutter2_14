import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

const _firstPaneKey = Key('FirstPane');
const _secondPaneKey = Key('SecondPane');

/// 画面サイズに応じてペインを分割表示する`Scaffold`
class AdaptiveSplitPaneScaffold extends StatelessWidget {
  const AdaptiveSplitPaneScaffold({
    super.key = const ValueKey('AdaptiveSplitPaneScaffold'),
    required this.body,
    this.secondaryBody,
    this.showSmallSecondary = true,
  });

  final Widget body;
  final Widget? secondaryBody;
  final bool showSmallSecondary;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          // 画面サイズがSmall以上の場合
          Breakpoints.smallAndUp: SlotLayout.from(
            key: _firstPaneKey,
            // 一覧画面などのデフォルト表示を切り替えるため、どちらを表示するべきか選択させる
            builder: (_) => secondaryBody != null && showSmallSecondary
                ? secondaryBody!
                : body,
          ),
          // 画面サイズがLarge(Expanded)の場合
          Breakpoints.large: SlotLayout.from(
            key: _firstPaneKey,
            builder: (_) => body,
          ),
        },
      ),
      // ガイドライン上の`Second pane`にあたる部分
      secondaryBody: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.smallAndUp: SlotLayout.from(
            key: _secondPaneKey,
          ),
          Breakpoints.large: SlotLayout.from(
            key: _secondPaneKey,
            builder: secondaryBody != null
                ? (_) => secondaryBody!
                : AdaptiveScaffold.emptyBuilder,
          ),
        },
      ),
    );
  }
}
