part of 'widgets.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({required this.size, required this.onTap, super.key});
  final BoxConstraints size;
  final VoidCallback onTap;

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
                  SizedBox(
                    width: size.maxWidth * 0.9,
                    child: Text(
                      LocaleStrings.reviewImageContainerHeading,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: kWhite,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    width: size.maxWidth * 0.9,
                    child: Text(
                      LocaleStrings.reviewImageContainerSubHeading,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.clip,
                            color: kWhite,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.02,
                  ),
                  InkWell(
                    onTap: onTap,
                    child: Container(
                      width: size.maxWidth * 0.4,
                      height: size.maxHeight * 0.07,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                      ),
                      child: Center(
                        child: Text(
                          LocaleStrings.reviewImageContainerButton,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.black),
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
