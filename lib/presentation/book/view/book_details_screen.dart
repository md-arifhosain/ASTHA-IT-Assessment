// ignore_for_file: deprecated_member_use

import 'package:astha_it_assessment/presentation/book/widgets/info_chip.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/color_manager.dart';
import '../../../data/models/book_list_model.dart';

// import 'package:flutter/material.dart';
class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    final info = book.volumeInfo;
    final title = info?.title ?? 'N/A';
    final author = info?.authors.isNotEmpty == true ? info!.authors[0] : 'N/A';
    final date = info?.publishedDate ?? 'N/A';
    final desc = info?.description ?? 'No description available.';
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0FF),
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorManager.whiteColor,
            size: 20,
          ),
        ),
        title: const Text(
          'Book Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorManager.whiteColor,
            letterSpacing: 0.3,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 36),
              decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // label
                  Text(
                    'Book Title',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.65),
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            Transform.translate(
              offset: const Offset(0, -20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.primaryColor.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InfoChip(
                              icon: Icons.person_outline_rounded,
                              label: 'Author(s)',
                              value: author,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: InfoChip(
                              icon: Icons.calendar_today_outlined,
                              label: 'Published',
                              value: date,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      const _Divider(),
                      const SizedBox(height: 24),

                      Row(
                        children: const [
                          Icon(
                            Icons.menu_book_outlined,
                            size: 16,
                            color: ColorManager.primaryColor,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.primaryColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        desc,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF49454F),
                          height: 1.7,
                        ),
                      ),
                    ],
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

// ── Divider ───────────────────────────────────────────────────────────────────

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Color(0xFF6750A4),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            color: const Color(0xFFE6E0E9),
          ),
        ),
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Color(0xFF6750A4),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
