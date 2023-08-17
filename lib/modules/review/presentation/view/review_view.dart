part of 'view.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(GetUserEvent());

    return Scaffold(
      floatingActionButton: LayoutBuilder(
        builder: (context, size) {
          return BlocBuilder<ReviewBloc, ReviewState>(
            builder: (context, state) {
              return SpeedDial(
                backgroundColor: Colors.white,
                overlayColor: Colors.transparent,
                icon: state.isChangeIcon ? Icons.close : Icons.add,
                onOpen: () {
                  context.read<ReviewBloc>().add(IsChangeEvent(isChange: true));
                },
                onClose: () {
                  context
                      .read<ReviewBloc>()
                      .add(IsChangeEvent(isChange: false));
                },
                spaceBetweenChildren: 15,
                children: [
                  SpeedDialChild(
                    shape: const CircleBorder(),
                    onTap: () {
                      context
                          .read<ReviewBloc>()
                          .add(IsChangeEvent(isChange: false));
                      _pickImageFromGallery();
                    },
                    child: Image.asset(
                      'assets/gallery.png',
                      width: size.maxWidth * 0.045,
                    ),
                    labelWidget: CommonText(
                      text: LocaleStrings.uploadPhotoButton,
                      color: Colors.white,
                      fontsize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SpeedDialChild(
                    shape: const CircleBorder(),
                    onTap: () {
                      context
                          .read<ReviewBloc>()
                          .add(IsChangeEvent(isChange: false));
                    },
                    child: Image.asset(
                      'assets/pen.png',
                      width: size.maxWidth * 0.045,
                    ),
                    labelWidget: CommonText(
                      text: LocaleStrings.writeReviewButton,
                      color: Colors.white,
                      fontsize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SpeedDialChild(
                    shape: const CircleBorder(),
                    onTap: () {
                      context
                          .read<ReviewBloc>()
                          .add(IsChangeEvent(isChange: false));
                      _launchUrl(Uri.parse('https://www.google.com'));
                    },
                    child: Image.asset(
                      'assets/pin_black.png',
                      width: size.maxWidth * 0.045,
                    ),
                    labelWidget: CommonText(
                      text: LocaleStrings.reviewAddPlaceButton,
                      color: Colors.white,
                      fontsize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Container(
              width: size.maxWidth,
              height: size.maxHeight,
              color: Colors.black87,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.maxHeight * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: CommonText(
                        text: LocaleStrings.reviewTitle,
                        color: Colors.white,
                        fontsize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.06,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: size.maxWidth * 0.11,
                            height: size.maxHeight * 0.06,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/mine.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.maxWidth * 0.06,
                          ),
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: state.user?.name ?? '',
                                    color: Colors.white,
                                    fontsize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CommonText(
                                    text:
                                        '0 ${LocaleStrings.reviews}, 0 ${LocaleStrings.drafts}, 0 ${LocaleStrings.photos}',
                                    color: Colors.white,
                                    fontsize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: Row(
                        children: [
                          ActionButton(
                            size: size,
                            text: LocaleStrings.writeReviewButton,
                            onTap: () {},
                          ),
                          SizedBox(
                            width: size.maxWidth * 0.025,
                          ),
                          ActionButton(
                            size: size,
                            text: LocaleStrings.uploadPhotoButton,
                            onTap: () {
                              _pickImageFromGallery();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.06,
                    ),
                    ImageContainer(size: size, onTap: () {}),
                    SizedBox(
                      height: size.maxHeight * 0.06,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: Align(
                        child: CommonText(
                          text: LocaleStrings.reviewMissingPlace,
                          color: Colors.white,
                          fontsize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: CommonText(
                        text: LocaleStrings.reviewAbout,
                        color: Colors.white,
                        fontsize: 19,
                        textAlign: TextAlign.center,
                        textOverflow: TextOverflow.clip,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: MissingPlaceButton(
                        onTap: () {
                          _launchUrl(Uri.parse('https://www.google.com'));
                        },
                        size: size,
                      ),
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.04,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(
        msg: LocaleStrings.urlLauncherError(url.toString()),
      );
    }
  }

  Future<void> _pickImageFromGallery() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
