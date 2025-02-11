import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field/core/extensions/extensions.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/svg_icon.dart';
import '../../collection/model/car_model.dart';

class CollectionDetailsPage extends StatefulWidget {
  static const String path = "/collection-details";
  static const String name = "CollectionDetails";
  const CollectionDetailsPage({super.key, required this.carProduct});

  final CarProduct carProduct;

  @override
  State<CollectionDetailsPage> createState() => _CollectionDetailsPageState();
}

class _CollectionDetailsPageState extends State<CollectionDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: context.colorScheme.onSecondary,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text('BMW collection'),
        actions: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              decoration: BoxDecoration(
                  color: context.colorScheme.surface, borderRadius: BorderRadius.circular(256)),
              padding: const EdgeInsets.all(16.0),
              child: SvgIcon(assetName: AppAssets.x, color: context.colorScheme.onSecondary),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppAssets.background,
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.paddingOf(context).top + 44.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.carProduct.imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            // _buildHeaderSection(),
            Container(
              color: context.colorScheme.onSurface,
              padding: const EdgeInsets.all(24.0),
              margin: EdgeInsets.fromLTRB(
                  24.0, 24.0, 24.0, MediaQuery.paddingOf(context).bottom + 16.0),
              child: Column(
                children: [
                  _buildTabBar(),
                  _buildTabContent(),
                ],
              ),
            ),
            _buildAddButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.carProduct.make,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            widget.carProduct.model,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.carProduct.year.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          color: context.colorScheme.primary,
        ),
        controller: _tabController,
        tabs: const [
          Tab(text: 'Details'),
          Tab(text: 'notes'),
          Tab(text: 'History'),
        ],
        labelColor: context.colorScheme.secondary,
        unselectedLabelColor: Colors.grey,
        dividerColor: Colors.transparent,
      ),
    );
  }

  Widget _buildTabContent() {
    return SizedBox(
      height: 250,
      child: TabBarView(
        controller: _tabController,
        children: [
          // _buildDetailsTab(),
          Center(
              child: Text(
            'Details',
            style: context.textStyle.titleLarge!.copyWith(color: context.colorScheme.onSecondary),
          )),
          Center(
              child: Text(
            'Tasting notes content',
            style: context.textStyle.titleLarge!.copyWith(color: context.colorScheme.onSecondary),
          )),
          Center(
              child: Text(
            'History content',
            style: context.textStyle.titleLarge!.copyWith(color: context.colorScheme.onSecondary),
          )),
        ],
      ),
    );
  }

  Widget _buildDetailsTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListView(
        children: [
          _buildDetailRow('Distillery', widget.carProduct.price.toString()),
          // _buildDetailRow('Region', widget.carProduct.details.region),
          // _buildDetailRow('Country', widget.carProduct.details.country),
          // _buildDetailRow('Type', widget.carProduct.details.type),
          // _buildDetailRow('Age statement', widget.carProduct.details.ageStatement),
          // _buildDetailRow('Filled', widget.carProduct.details.filled),
          // _buildDetailRow('carProductd', widget.carProduct.details.carProductd),
          // _buildDetailRow('Cask number', widget.carProduct.details.caskNumber),
          // _buildDetailRow('ABV', widget.carProduct.details.abv),
          // _buildDetailRow('Size', widget.carProduct.details.size),
          // _buildDetailRow('Finish', widget.carProduct.details.finish),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, MediaQuery.paddingOf(context).bottom + 16.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('Add to my collection'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          // Handle add to collection
        },
      ),
    );
  }
}
