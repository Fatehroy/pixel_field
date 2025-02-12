import 'package:flutter/material.dart';
import 'package:pixel_field/core/extensions/extensions.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String description;

  const TimelineItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Column(
        //   children: [
        //     Container(
        //       width: 16,
        //       height: 16,
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //         shape: BoxShape.circle,
        //       ),
        //     ),
        //     Container(
        //       width: 2,
        //       height: 60,
        //       color: const Color(0xFFFFB400),
        //     ),
        //     Container(
        //       width: 8,
        //       height: 8,
        //       decoration: const BoxDecoration(
        //         color: Color(0xFFFFB400),
        //         shape: BoxShape.circle,
        //       ),
        //     ),
        //     Container(
        //       width: 2,
        //       height: 60,
        //       color: const Color(0xFFFFB400),
        //     ),
        //   ],
        // ),
        // const SizedBox(width: 16),
        Expanded(
          child: Card(
            elevation: 0,
            // color: const Color(0xFF19232D),z
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Label',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  const AttachmentsWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AttachmentsWidget extends StatelessWidget {
  const AttachmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📎 Attachments',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
