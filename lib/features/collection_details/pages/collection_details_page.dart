import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field/core/di/di.dart';
import 'package:pixel_field/core/extensions/extensions.dart';
import 'package:pixel_field/features/collection_details/cubit/collection_details_cubit.dart';
import 'package:pixel_field/features/collection_details/cubit/collection_details_state.dart';
import 'package:pixel_field/features/collection_details/widgets/car_details_section.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/svg_icon.dart';
import '../../collection/model/car_model.dart';
import '../widgets/car_image.dart';

class CollectionDetailsPage extends StatefulWidget {
  static const String path = "/collection-details";
  static const String name = "CollectionDetails";
  const CollectionDetailsPage({super.key, required this.carId});

  final String carId;

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
    sl<CollectionDetailsCubit>().fetchCollectionDetails(widget.carId);
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
        child:
            BlocBuilder<CollectionDetailsCubit, CollectionDetailsState>(builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (carDetails) => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.paddingOf(context).top + 44.0),
                  CarImage(imageUrl: carDetails.imageUrl),
                  CarDetailsSection(carProduct: carDetails),
                  AddToCollectionButton(
                    onPressed: () {
                      // Handle add to collection logic here
                    },
                  ),
                ],
              ),
            ),
            error: (message) => Center(
                child: Text('Error: $message',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: context.colorScheme.onSecondary))),
          );
        }),
      ),
    );
  }
}

class AddToCollectionButton extends StatelessWidget {
  const AddToCollectionButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, MediaQuery.paddingOf(context).bottom + 16.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('Add to my collection'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
