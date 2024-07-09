import 'package:flutter/widgets.dart';

class AdaptiveCenteredWrapper extends StatelessWidget {
  final Widget child;

  const AdaptiveCenteredWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: child,
      ),
    );
  }
}
