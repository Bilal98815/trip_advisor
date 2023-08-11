part of 'view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
                    context.go(
                      EditProfilePage.route(),
                      extra: BlocProvider.of<ProfileBloc>(context),
                    );
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
        title: const CommonText(
          text: 'Profile',
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
                                    text: 'Joined in ${time.year}',
                                    color: Colors.white,
                                    fontsize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const CommonText(
                                    text: '0 contributions',
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
                                ? 'Share a little about yourself so other travelers can get to know you!'
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
                                ? 'No city selected.'
                                : state.user?.country ?? '',
                            onTap: () => context.go(
                              EditProfilePage.route(),
                              extra: BlocProvider.of<ProfileBloc>(context),
                            ),
                            image: 'assets/placeholder.png',
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.025,
                          ),
                          PersonalDetailTile(
                            size: size,
                            text: state.user?.website == ''
                                ? 'No website added.'
                                : state.user?.website ?? '',
                            onTap: () => context.go(
                              EditProfilePage.route(),
                              extra: BlocProvider.of<ProfileBloc>(context),
                            ),
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
                              isTextWidget: state.user?.photos?.isEmpty ?? true,
                              buttonText: 'Upload a photo',
                              number: state.user?.photos?.length ?? 0,
                              actionTitle: 'photos',
                            ),
                          ActionForm(
                            onTap: () {},
                            size: size,
                            isTextWidget: true,
                            buttonText: 'Write a review',
                            number: 0,
                            actionTitle: 'reviews',
                          ),
                          ActionForm(
                            onTap: () {
                              _launchUrl(Uri.parse('https://www.google.com'));
                            },
                            size: size,
                            isTextWidget: true,
                            buttonText: 'Post to a forum',
                            number: 0,
                            actionTitle: 'forum posts',
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.05,
                          ),
                          const CommonText(
                            text: 'More',
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
                            title: 'Badges',
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.02,
                          ),
                          MoreOptionTile(
                            onTap: () {
                              _launchUrl(Uri.parse('https://www.google.com'));
                            },
                            size: size,
                            title: 'Travel map',
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

  _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }
}
