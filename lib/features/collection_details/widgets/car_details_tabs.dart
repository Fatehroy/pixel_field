import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/features/collection_details/widgets/timeline.dart';

import '../../collection/model/car_model.dart';
import 'car_details_section.dart';
import 'timeline_item.dart';

class CarDetailsSectionTabs extends StatefulWidget {
  const CarDetailsSectionTabs({super.key, required this.carProduct});
  final CarProduct carProduct;

  @override
  State<CarDetailsSectionTabs> createState() => _CarDetailsSectionTabsState();
}

class _CarDetailsSectionTabsState extends State<CarDetailsSectionTabs>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(context),
        AutoScaleTabBarView(
          controller: _tabController,
          children: [
            SpecificationsTab(specifications: widget.carProduct.specifications),
            SpecificationsTab(specifications: widget.carProduct.performanceAndFeatures),
            _buildHistoryTab(context),
          ],
        )
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: _tabBarMargin),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: context.colorScheme.primary,
        ),
        tabs: const [
          Tab(text: 'Details'),
          Tab(text: 'Performance'),
          Tab(text: 'History'),
        ],
        labelColor: context.colorScheme.secondary,
        unselectedLabelColor: Colors.grey,
        dividerColor: Colors.transparent,
      ),
    );
  }

  Widget _buildHistoryTab(BuildContext context) {
    return CustomTimeline(
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(4,
          (index) => const TimelineItem(title: 'Title', description: 'Description\nDescription')),
    );
  }

  static const double _tabBarMargin = 24.0;
  static const double _borderRadius = 8.0;
}

class SpecificationsTab extends StatelessWidget {
  const SpecificationsTab({super.key, required this.specifications});
  final List specifications;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          specifications.map((spec) => DetailRow(label: spec.title, value: spec.value)).toList(),
    );
  }
}
