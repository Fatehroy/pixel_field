import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';

class CustomTimeline extends StatelessWidget {
  const CustomTimeline({
    super.key,
    required this.children,
    this.indicators,
    this.itemGap = 12.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = Colors.grey,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.lineGap = 4.0,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
  })  : itemCount = children.length,
        assert(itemGap >= 0),
        assert(lineGap >= 0),
        assert(indicators == null || children.length == indicators.length);

  final List<Widget> children;
  final double itemGap;

  final List<Widget>? indicators;

  final EdgeInsets padding;
  final ScrollController? controller;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double lineGap;
  final double indicatorSize;

  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surface,
      child: ListView.separated(
        padding: padding,
        separatorBuilder: (_, __) => SizedBox(height: itemGap),
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemCount: itemCount,
        controller: controller,
        reverse: reverse,
        primary: primary,
        itemBuilder: (context, index) {
          final child = children[index];

          final isFirst = index == 0;

          final timelineTile = <Widget>[
            SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: CustomPaint(
                foregroundPainter: _TimelinePainter(
                  lineColor: context.colorScheme.primary,
                  indicatorColor: context.colorScheme.onSecondary,
                  indicatorSize: indicatorSize,
                  indicatorStyle: indicatorStyle,
                  isFirst: isFirst,
                  lineGap: lineGap,
                  strokeCap: strokeCap,
                  strokeWidth: strokeWidth,
                  style: style,
                  itemGap: itemGap,
                ),
              ),
            ),
            SizedBox(width: 4.0),
            Expanded(child: child),
          ];

          return IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: timelineTile,
            ),
          );
        },
      ),
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    required this.indicatorColor,
    required this.indicatorStyle,
    required this.indicatorSize,
    required this.lineGap,
    required this.strokeCap,
    required this.strokeWidth,
    required this.style,
    required this.lineColor,
    required this.isFirst,
    required this.itemGap,
  })  : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;

  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;

    final topPadding = 24.0;

    final top = size.topLeft(Offset(indicatorRadius, isFirst ? topPadding : 0.0 - halfItemGap));

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemGap));

    canvas.drawLine(top, bottom, linePaint);
    _drawDiamond(canvas, size.center(Offset(0, indicatorSize)), 8, linePaint);
    _drawDiamond(canvas, size.center(Offset(0, indicatorSize - topPadding)), 4, linePaint);
    _drawDiamond(canvas, size.center(Offset(0, indicatorSize + topPadding)), 4, linePaint);

    final Offset offsetCenter = size.topLeft(Offset(indicatorRadius, topPadding));
    canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
  }

  void _drawDiamond(Canvas canvas, Offset center, double size, Paint paint) {
    final Path path = Path()
      ..moveTo(center.dx, center.dy - size) // Top
      ..lineTo(center.dx + size, center.dy) // Right
      ..lineTo(center.dx, center.dy + size) // Bottom
      ..lineTo(center.dx - size, center.dy) // Left
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
