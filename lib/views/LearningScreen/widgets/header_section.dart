import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/models/single_course_model.dart';
import '../../../helpers/star_display_helper.dart';
import '../../../utils/colors.dart';
import '../../../utils/themes.dart';

class HeaderSection extends StatefulWidget {
  final SingleCourseModel arg;

  const HeaderSection({super.key, required this.arg});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 2,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.arg.title!,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormat.extraSmall(
                        text: 'By ${widget.arg.teacher}', opacity: .5),
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: StarDisplayWidget(
                            value: widget.arg.rating!.toInt(),
                            filledStar: Icon(
                              Icons.star,
                              color: AppColors.primary,
                              size: 15,
                            ),
                            unfilledStar: Icon(
                              Icons.star_border,
                              color: AppColors.primary.withOpacity(.5),
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            '( ${widget.arg.rating} )',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
               !widget.arg.isPurchased! ? Container(
                  height: size.height * .2,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: 
                  CachedNetworkImage(imageUrl: widget.arg.thumbnail!, fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 120,
                    child: Center(
                      child: Image.asset(
                                        'assets/images/logo.webp',
                                        fit: BoxFit.contain,
                                      ),
                    ),
                  ),
                  )
                  // NewVideoPlayer(
                  //   videoUrl: widget.arg.preview!,
                  //   thumbnail: widget.arg.thumbnail!, // Thumbnail image URL
                  //   title: widget.arg.title,
                  //   autoPlay: true,
                  //   looping: true,
                  // ),
                ) : SizedBox.shrink(),
                // Container(
                //   height: size.height * .2,
                //   width: size.width,
                //   decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(20),
                //       image:
                //           DecorationImage(image: NetworkImage(arg.thumbnail))),
                // ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
