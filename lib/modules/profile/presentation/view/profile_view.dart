part of 'view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profile';
  static String route() => '/account/profile';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(GetUserEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        actions: [
          LayoutBuilder(
            builder: (context, size) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    context.go(EditProfilePage.route());
                  },
                  child: const Icon(Icons.create, color: Colors.white),
                ),
              );
            },
          ),
        ],
        leading: LayoutBuilder(
          builder: (context, size) {
            return Padding(
              padding: EdgeInsets.only(left: size.maxWidth * 0.5),
              child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        title: CommonText(
          text: LocaleStrings.profileTitle,
          color: Colors.white,
          fontsize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.apiState == ApiState.done) {
              return LayoutBuilder(
                builder: (context, size) {
                  final DateTime time =
                      state.user?.time?.toDate() ?? DateTime.now();
                  return Container(
                    width: size.maxWidth,
                    height: size.maxHeight,
                    color: Colors.black87,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.maxHeight * 0.02,
                          ),
                          Row(
                            children: [
                              if (state.user?.imageUrl != null)
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                    state.user?.imageUrl ?? '',
                                  ),
                                )
                              else
                                const CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('assets/mine.jpg'),
                                ),
                              SizedBox(
                                width: size.maxWidth * 0.06,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: state.user?.name ?? '',
                                    color: Colors.white,
                                    fontsize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  CommonText(
                                    text:
                                        '${LocaleStrings.profileJoiningText} ${time.year}',
                                    color: Colors.white,
                                    fontsize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  CommonText(
                                    text:
                                        '0 ${LocaleStrings.profileContributionText}',
                                    color: Colors.white,
                                    fontsize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.02,
                          ),
                          CommonText(
                            text: state.user?.bio == ''
                                ? LocaleStrings.profileBio
                                : state.user?.bio ?? '',
                            color: Colors.grey.shade400,
                            textAlign: TextAlign.start,
                            textOverflow: TextOverflow.clip,
                            fontsize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.05,
                          ),
                          PersonalDetailTile(
                            size: size,
                            text: state.user?.country == ''
                                ? LocaleStrings.profileCity
                                : state.user?.country ?? '',
                            onTap: () => context.go(EditProfilePage.route()),
                            image: 'assets/placeholder.png',
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.025,
                          ),
                          PersonalDetailTile(
                            size: size,
                            text: state.user?.website == ''
                                ? LocaleStrings.profileWebsite
                                : state.user?.website ?? '',
                            onTap: () => context.go(EditProfilePage.route()),
                            image: 'assets/link.png',
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.06,
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 0.4,
                          ),
                          if (state.apiState == ApiState.loading)
                            const Center(child: CircularProgressIndicator())
                          else
                            ActionForm(
                                onTap: () {
                                  context
                                      .read<ProfileBloc>()
                                      .add(PickImagesEvent());
                                },
                                size: size,
                                isTextWidget:
                                    state.user?.photos?.isEmpty ?? true,
                                buttonText: LocaleStrings.profilePhotosButton,
                                number: state.user?.photos?.length ?? 0,
                                actionTitle: LocaleStrings.profilePhotosTitle),
                          ActionForm(
                            onTap: () {},
                            size: size,
                            isTextWidget: true,
                            buttonText: LocaleStrings.profileReviewButton,
                            number: 0,
                            actionTitle: LocaleStrings.profileReviewTitle,
                          ),
                          ActionForm(
                            onTap: () {
                              _launchUrl(Uri.parse('https://www.google.com'));
                            },
                            size: size,
                            isTextWidget: true,
                            buttonText: LocaleStrings.profilePostsButton,
                            number: 0,
                            actionTitle: LocaleStrings.profilePostsTitle,
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.05,
                          ),
                          CommonText(
                            text: LocaleStrings.profileMoreTitle,
                            color: Colors.white,
                            fontsize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.05,
                          ),
                          MoreOptionTile(
                            onTap: () {
                              _launchUrl(Uri.parse('https://www.google.com'));
                            },
                            size: size,
                            title: LocaleStrings.profileBadgesTile,
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.02,
                          ),
                          MoreOptionTile(
                            onTap: () {
                              _launchUrl(Uri.parse('https://www.google.com'));
                            },
                            size: size,
                            title: LocaleStrings.profileTravelTile,
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.07,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }
}
