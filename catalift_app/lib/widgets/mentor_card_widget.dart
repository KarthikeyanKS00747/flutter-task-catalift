import 'package:catalift_app/utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:catalift_app/models/mentor_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorCard extends StatelessWidget {
  final MentorModel mentor;

  const MentorCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 195.h,
      margin: EdgeInsets.only(bottom: 16.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(13.0.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22.0.sp,
              backgroundImage: NetworkImage(mentor.imageUrl),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_border_outlined,
                              color: Colors.green, size: 14.0.sp),
                          const SizedBox(width: 4.0),
                          Text(
                            mentor.rating.toString(),
                            style: TextStyle(
                                fontSize: 10.0.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.green),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0.h,
                          vertical: 2.0.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          mentor.sector,
                          style: TextStyle(
                            fontSize: 8.0.sp,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0.h),
                  Text(
                    mentor.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.0.h),
                  Row(
                    children: [
                      Icon(Icons.alarm,
                          size: 12.0.sp, color: Apptheme.fontPrimary),
                      SizedBox(width: 4.0.sp),
                      Text(
                        '${mentor.experienceYears} years',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                            fontSize: 10.0.sp, color: Apptheme.fontPrimary),
                      ),
                      SizedBox(width: 16.0.sp),
                      Icon(Icons.shopping_bag_outlined,
                          size: 12.0.sp, color: Apptheme.fontPrimary),
                      SizedBox(width: 4.0.sp),
                      Text(
                        mentor.domain,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                            fontSize: 10.0.sp, color: Apptheme.fontPrimary),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0.h),
                  Row(
                    children: [
                      Icon(Icons.message,

                          size: 12.0.sp, color: Apptheme.fontPrimary),
                      SizedBox(width: 4.0.sp),
                      Text(
                        '${mentor.reviewsCount} Reviews',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                            fontSize: 10.0.sp, color: Apptheme.fontPrimary),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0.h),
                  Text(
                    mentor.description,
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10.0.h),
                  Row(
                    children: [
                      Text(
                        '${mentor.compatibility}%',
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.bold,
                          color: getCompatibilityColor(mentor.compatibility),
                        ),
                      ),
                      SizedBox(width: 4.0.sp),
                      Text(
                        'compatibility',
                        style: TextStyle(
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getCompatibilityColor(int compatibility) {
    if (compatibility >= 90) {
      return Colors.green;
    } else if (compatibility >= 70) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
