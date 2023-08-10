import 'package:flutter/material.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({required this.size, required this.onTap, super.key});
  final BoxConstraints size;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.maxWidth,
      height: size.maxHeight * 0.7,
      child: Stack(
        children: [
          Image.asset(
            'assets/stone_monument.jpg',
            width: size.maxWidth,
            height: size.maxHeight,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 90,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.maxWidth * 0.08,
                vertical: size.maxHeight * 0.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(
                    text: 'We want you to',
                    color: Colors.white,
                    fontsize: 40,
                    fontWeight: FontWeight.w900,
                    textOverflow: TextOverflow.clip,
                    textAlign: TextAlign.start,
                  ),
                  const CommonText(
                    text: 'write us a review',
                    color: Colors.white,
                    fontsize: 40,
                    fontWeight: FontWeight.w900,
                    textOverflow: TextOverflow.clip,
                    textAlign: TextAlign.start,
                  ),
                  const CommonText(
                    text: 'Because who else we turn to for',
                    color: Colors.white,
                    fontsize: 20,
                    fontWeight: FontWeight.w500,
                    textOverflow: TextOverflow.clip,
                    textAlign: TextAlign.start,
                  ),
                  const CommonText(
                    text: 'travel advice?',
                    color: Colors.white,
                    fontsize: 20,
                    fontWeight: FontWeight.w500,
                    textOverflow: TextOverflow.clip,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      onTap.call();
                    },
                    child: Container(
                      width: size.maxWidth * 0.4,
                      height: size.maxHeight * 0.07,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                      ),
                      child: const Center(
                        child: CommonText(
                          text: 'What to know',
                          color: Colors.black,
                          fontsize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
