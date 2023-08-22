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
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                overlayColor: kTransparent,
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
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
                    labelWidget: Text(
                      LocaleStrings.uploadPhotoButton,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                  ),
                  SpeedDialChild(
                    shape: const CircleBorder(),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    onTap: () {
                      context
                          .read<ReviewBloc>()
                          .add(IsChangeEvent(isChange: false));
                    },
                    child: Image.asset(
                      'assets/pen.png',
                      width: size.maxWidth * 0.045,
                    ),
                    labelWidget: Text(
                      LocaleStrings.writeReviewButton,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                  ),
                  SpeedDialChild(
                    shape: const CircleBorder(),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    onTap: () {
                      context
                          .read<ReviewBloc>()
                          .add(IsChangeEvent(isChange: false));
                      UrlLauncher().launchCustomUrl(
                        Uri.parse('https://www.google.com'),
                      );
                    },
                    child: Image.asset(
                      'assets/pin_black.png',
                      width: size.maxWidth * 0.045,
                    ),
                    labelWidget: Text(
                      LocaleStrings.reviewAddPlaceButton,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.background,
                          ),
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
              color: Theme.of(context).colorScheme.background,
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
                      child: Text(
                        LocaleStrings.reviewTitle,
                        style: Theme.of(context).textTheme.titleLarge,
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
                                  Text(
                                    state.user?.name ?? '',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Text(
                                    '0 ${LocaleStrings.reviews}, 0 ${LocaleStrings.drafts}, 0 ${LocaleStrings.photos}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
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
                        child: Text(
                          LocaleStrings.reviewMissingPlace,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 22,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.08,
                      ),
                      child: Text(
                        LocaleStrings.reviewAbout,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                  overflow: TextOverflow.clip,
                                ),
                        textAlign: TextAlign.center,
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
                        onTap: () => UrlLauncher().launchCustomUrl(
                          Uri.parse('https://www.google.com'),
                        ),
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

  Future<void> _pickImageFromGallery() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
