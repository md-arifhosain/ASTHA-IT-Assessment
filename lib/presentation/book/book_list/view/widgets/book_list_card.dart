import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/models/book_list_model.dart';

class BookListCard extends StatelessWidget {
  const BookListCard({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,

   
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6750A4).withOpacity(0.10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: SizedBox(
              height: 155.h,
              width: double.infinity,
              child: Image.network(
                book.volumeInfo?.imageLinks?.thumbnail??'',
          
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFF3EDF7),
                  child: const Center(
                    child: Icon(
                      Icons.menu_book_rounded,
                      size: 32,
                      color: Color(0xFF6750A4),
                    ),
                  ),
                ),
              ),
            ),
          ),
             SizedBox(height: 5,),

          // ── Text Section ──────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title
                Text("joipjasbhrgouaeiwhfg9uehwdfeuoifhuaerwhg9uehrwagijuaeorwigaregorfghuaoasdfouharw9ghouiaehr",
                 // book.volumeInfo?.title ?? 'N/A',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C1B1F),
                    height: 1.35,
                  ),
                ),
                SizedBox(height: 5,),
                Text("uiohasiouvhdsivisadvidasiviadsvhi",
                 // book.volumeInfo?.authors[0] ?? 'N/A',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF79747E),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
