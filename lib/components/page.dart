import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class DefaultPage extends StatefulWidget {
  final Widget body;
  final double? padding;
  final double defaultPadding = 16.0;
  final bool scrollable;

  const DefaultPage({
    super.key,
    required this.body,
    this.padding,
    this.scrollable = true,
  });

  @override
  State<StatefulWidget> createState() => DefaultPageState();
}

class DefaultPageState extends State<DefaultPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant DefaultPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void scrollTop() {
    _scrollController.animateTo(
      0,
      duration: Duration.zero,
      curve: 0.0 as Curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      resizeToAvoidBottomInset: true,
      child: widget.scrollable
          ? SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.all(
                  widget.padding ?? widget.defaultPadding,
                ),
                child: widget.body,
              ),
            )
          : Padding(
              padding: EdgeInsets.all(widget.padding ?? widget.defaultPadding),
              child: widget.body,
            ),
    );
  }
}
