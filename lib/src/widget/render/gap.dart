import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends SingleChildRenderObjectWidget {
  const Gap({super.key, this.width, this.height, super.child});

  const Gap.height(double this.height, {super.key, super.child}) : width = null;

  const Gap.width(double this.width, {super.key, super.child}) : height = null;

  const Gap.square({super.key, super.child, double? dimension})
      : width = dimension,
        height = dimension;

  final double? width;

  final double? height;

  @override
  RenderConstrainedBox createRenderObject(BuildContext context) {
    return RenderConstrainedBox(additionalConstraints: _additionalConstraints);
  }

  BoxConstraints get _additionalConstraints {
    return BoxConstraints.tightFor(width: width?.w, height: height?.h);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderConstrainedBox renderObject,
  ) {
    renderObject.additionalConstraints = _additionalConstraints;
  }
}
