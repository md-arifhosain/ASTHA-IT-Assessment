// import 'package:astha_it_assessment/data/models/book_favourite_model.dart';
// import 'package:astha_it_assessment/presentation/book/book_list/viewmodel/book_favourite_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../../core/resources/icon_manager.dart';
// import '../../../../../core/route/route_name.dart';
// import '../../../../../data/models/book_list_model.dart';

// class BookListCard extends StatelessWidget {
//   const BookListCard({super.key, required this.book, required this.ref});
//   final BookModel book;
//   final WidgetRef ref;

//   @override
//   Widget build(BuildContext context) {
//        final favourites = ref.watch(
//       bookFavouriteProvider,
//     );

//     final isFavourite = favourites.any(
//       (e) => e.id == book.id,
//     );

//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, RoutesName.bookDetailsScreen,
//         arguments: book
//         );
//       },
//       child: Container(
//         width: 130.w,

//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Color(0xFF6750A4).withValues(alpha: 0.10),
//               blurRadius: 16,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(16),
//                   ),
//                   child: SizedBox(
//                     height: 155.h,
//                     width: double.infinity,
//                     child: Image.network(
//                       book.volumeInfo?.imageLinks?.thumbnail ?? '',

//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) => Container(
//                         color: const Color(0xFFF3EDF7),
//                         child: const Center(
//                           child: Icon(
//                             Icons.menu_book_rounded,
//                             size: 32,
//                             color: Color(0xFF6750A4),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5),

//                 // ── Text Section ──────────────────────────────────────────
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Title
//                       Text(
//                         book.volumeInfo?.title ?? 'N/A',
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFF1C1B1F),
//                           height: 1.35,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         book.volumeInfo?.authors.isNotEmpty == true
//                             ? book.volumeInfo?.authors[0] ?? 'N/A'
//                             : 'N/A',
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF79747E),
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               top: 10,
//               right: 10,
//               child: GestureDetector(
//                 onTap: () {
//                   ref
//                       .read(bookFavouriteProvider.notifier)
//                       .toggleFavorite(
//                         book: BookFavouriteModel(
//                           id: book.id ?? '',
//                           isFavourite: !isFavourite,
//                         ),
//                       );
//                 },
//                 child: SvgPicture.asset(
//                   // color:Colors.red  ,
//                   IconManager.favouriteIcon,
//                   width: 24.h,
//                   height: 24.h,
//                   colorFilter: ColorFilter.mode(
//                     isFavourite ? Colors.red : Colors.grey,
//                     BlendMode.srcIn,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:astha_it_assessment/data/models/book_favourite_model.dart';
import 'package:astha_it_assessment/presentation/book/book_list/viewmodel/book_favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/icon_manager.dart';
import '../../../../../core/route/route_name.dart';
import '../../../../../data/models/book_list_model.dart';

class BookListCard extends StatelessWidget {
  const BookListCard({super.key, required this.book, required this.ref});
  final BookModel book;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final favourites = ref.watch(bookFavouriteProvider);
    final isFavourite = favourites.any((e) => e.id == book.id);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesName.bookDetailsScreen,
          arguments: book,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6750A4).withValues(alpha: 0.09),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Cover Image ─────────────────────────────────────
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: SizedBox(
                    height: 175.h,
                    width: double.infinity,
                    child: Image.network(
                      book.volumeInfo?.imageLinks?.thumbnail ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFEDE0FF), Color(0xFFCDB4F5)],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.menu_book_rounded,
                            size: 36,
                            color: Color(0xFF6750A4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ── Text Section ────────────────────────────────────
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title
                        Text(
                          book.volumeInfo?.title ?? 'N/A',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1C1B1F),
                            height: 1.35,
                          ),
                        ),

                        // Author row with icon
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline_rounded,
                              size: 12,
                              color: Color(0xFF6750A4),
                            ),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                book.volumeInfo?.authors.isNotEmpty == true
                                    ? book.volumeInfo?.authors[0] ?? 'N/A'
                                    : 'N/A',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF79747E),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // ── Favourite Button ────────────────────────────────────
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  ref.read(bookFavouriteProvider.notifier).toggleFavorite(
                        book: BookFavouriteModel(
                          id: book.id ?? '',
                          isFavourite: !isFavourite,
                        ),
                      );
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      IconManager.favouriteIcon,
                      width: 17.h,
                      height: 17.h,
                      colorFilter: ColorFilter.mode(
                        isFavourite ? Colors.red : Colors.grey.shade400,
                        BlendMode.srcIn,
                      ),
                    ),
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