part of 'view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profile';

  static String route() => '/account/profile';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(GetUserEvent());

    final Assets assets = AssetProvider.of(context).assets;

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleStrings.profileTitle,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => context.go(EditProfilePage.route()),
              child: const Icon(Icons.create),
            ),
          ),
        ],
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
                    color: Theme.of(context).colorScheme.background,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.maxHeight * 0.02),
                          Row(
                            children: [
                              if (state.user?.imageUrl != '')
                                CachedNetworkImage(
                                  imageUrl: state.user?.imageUrl ?? '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: size.maxHeight * 0.17,
                                    width: size.maxWidth * 0.18,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )
                              else
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    assets.defaultProfilePic,
                                  ),
                                ),
                              SizedBox(width: size.maxWidth * 0.06),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.user?.name ?? '',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    '${LocaleStrings.profileJoiningText} ${time.year}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    '0 ${LocaleStrings.profileContributionText}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.maxHeight * 0.02),
                          Text(
                            state.user?.bio == ''
                                ? LocaleStrings.profileBio
                                : state.user?.bio ?? '',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  overflow: TextOverflow.clip,
                                ),
                          ),
                          SizedBox(height: size.maxHeight * 0.05),
                          PersonalDetailTile(
                            size: size,
                            text: state.user?.country == ''
                                ? LocaleStrings.profileCity
                                : state.user?.country ?? '',
                            onTap: () => context.go(EditProfilePage.route()),
                            image: assets.profileCityIcon,
                          ),
                          SizedBox(height: size.maxHeight * 0.025),
                          PersonalDetailTile(
                            size: size,
                            text: state.user?.website == ''
                                ? LocaleStrings.profileWebsite
                                : state.user?.website ?? '',
                            onTap: () => context.go(EditProfilePage.route()),
                            image: assets.profileWebsiteIcon,
                          ),
                          SizedBox(height: size.maxHeight * 0.06),
                          const Divider(),
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
                              isTextWidget: state.user?.photos?.isEmpty ?? true,
                              buttonText: LocaleStrings.profilePhotosButton,
                              number: state.user?.photos?.length ?? 0,
                              actionTitle: LocaleStrings.profilePhotosTitle,
                            ),
                          ActionForm(
                            onTap: () {},
                            size: size,
                            isTextWidget: true,
                            buttonText: LocaleStrings.profileReviewButton,
                            number: 0,
                            actionTitle: LocaleStrings.profileReviewTitle,
                          ),
                          ActionForm(
                            onTap: () => UrlLauncher().launchCustomUrl(
                              Uri.parse('https://www.google.com'),
                            ),
                            size: size,
                            isTextWidget: true,
                            buttonText: LocaleStrings.profilePostsButton,
                            number: 0,
                            actionTitle: LocaleStrings.profilePostsTitle,
                          ),
                          SizedBox(height: size.maxHeight * 0.05),
                          Text(
                            LocaleStrings.profileMoreTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.05,
                          ),
                          MoreOptionTile(
                            onTap: () => UrlLauncher().launchCustomUrl(
                              Uri.parse('https://www.google.com'),
                            ),
                            size: size,
                            title: LocaleStrings.profileBadgesTile,
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.02,
                          ),
                          MoreOptionTile(
                            onTap: () => UrlLauncher().launchCustomUrl(
                              Uri.parse('https://www.google.com'),
                            ),
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
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
