part of 'view.dart';

//ignore: must_be_immutable
class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  final nameController = TextEditingController();
  final websiteController = TextEditingController();
  final aboutController = TextEditingController();
  Uint8List? img;
  final List<String> items = [
    'UK',
    'America',
    'Canada',
    'Australia',
    'Pakistan'
  ];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    BlocProvider.of<ProfileBloc>(context).add(GetUserEvent());

    return Scaffold(
      appBar: CustomAppBar(title: LocaleStrings.editProfileTitle),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.maxHeight * 0.04),
                    SizedBox(
                      width: size.maxWidth * 0.2,
                      height: size.maxHeight * 0.11,
                      child: Stack(
                        children: [
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if (state.user?.imageUrl != null) {
                                return CircleAvatar(
                                  radius: 64,
                                  backgroundImage:
                                      NetworkImage(state.user?.imageUrl ?? ''),
                                );
                              } else {
                                return const CircleAvatar(
                                  radius: 64,
                                  backgroundImage:
                                      AssetImage('assets/mine.jpg'),
                                );
                              }
                            },
                          ),
                          Positioned(
                            bottom: 1,
                            left: 50,
                            child: InkWell(
                              onTap: () {
                                pickImageFromGallery().then((value) {
                                  img = value;
                                  if (img != null) {
                                    context
                                        .read<EditProfileBloc>()
                                        .add(UpdateImageEvent(img: img!));
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: colorScheme.onBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: colorScheme.background,
                                  size: 17,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.maxHeight * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleStrings.editProfileNameLabel,
                          style: textTheme.labelSmall,
                        ),
                        SizedBox(height: size.maxHeight * 0.01),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              controller: nameController,
                              hintText: state.user?.name ??
                                  LocaleStrings.editProfileNameHint,
                            );
                          },
                        ),
                        SizedBox(height: size.maxHeight * 0.03),
                        Text(
                          LocaleStrings.editProfileCityLabel,
                          style: textTheme.labelSmall,
                        ),
                        SizedBox(height: size.maxHeight * 0.01),
                        Container(
                          width: size.maxWidth,
                          height: size.maxHeight * 0.08,
                          padding: EdgeInsets.symmetric(
                            vertical: size.maxHeight * 0.01,
                            horizontal: size.maxWidth * 0.03,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: colorScheme.outline),
                          ),
                          child: BlocBuilder<EditProfileBloc, EditProfileState>(
                            builder: (context, state) {
                              debugPrint('---->> Country: ${state.country}');
                              return DropdownButton(
                                icon: const SizedBox.shrink(),
                                underline: const SizedBox.shrink(),
                                hint: Text(
                                  state.country,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                dropdownColor: Colors.black87,
                                style: const TextStyle(color: Colors.white),
                                items: items.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  context
                                      .read<EditProfileBloc>()
                                      .add(UpdateCountryEvent(country: value!));
                                  context
                                      .read<EditProfileBloc>()
                                      .add(StoreCountryDbEvent(country: value));
                                  debugPrint('---->> Selected Country: $value');
                                  debugPrint(
                                    '---->> Country: ${state.country}',
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: size.maxHeight * 0.03),
                        Text(
                          LocaleStrings.editProfileWebsiteLabel,
                          style: textTheme.labelSmall,
                        ),
                        SizedBox(height: size.maxHeight * 0.01),
                        CustomTextFormField(
                          controller: websiteController,
                          hintText: LocaleStrings.editProfileWebsiteHint,
                        ),
                        SizedBox(height: size.maxHeight * 0.03),
                        Text(
                          LocaleStrings.editProfileAboutLabel,
                          style: textTheme.labelSmall,
                        ),
                        SizedBox(height: size.maxHeight * 0.01),
                        CustomTextFormField(
                          controller: aboutController,
                          maxLines: 4,
                          onChanged: (val) {
                            context
                                .read<EditProfileBloc>()
                                .add(UpdateCountEvent(count: val.length));
                          },
                          hintText: LocaleStrings.editProfileAboutHint,
                        ),
                        SizedBox(height: size.maxHeight * 0.01),
                        BlocBuilder<EditProfileBloc, EditProfileState>(
                          builder: (context, state) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: CommonText(
                                text: '${state.count}/160',
                                color: Colors.white,
                                fontsize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(height: size.maxHeight * 0.09),
                    BlocConsumer<EditProfileBloc, EditProfileState>(
                      listener: (context, state) {
                        if (state.apiState == ApiState.saved) {
                          context.read<ProfileBloc>().add(GetUserEvent());
                          Navigator.pop(context);
                        } else if (state.apiState == ApiState.error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: colorScheme.error,
                              content: Text(LocaleStrings.editProfileError),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return PrimaryButton(
                          ignoring: state.apiState == ApiState.loading,
                          onTap: () {
                            context.read<EditProfileBloc>().add(
                                  UpdateUserEvent(
                                    bio: aboutController.text.isEmpty
                                        ? null
                                        : aboutController.text,
                                    name: nameController.text.isEmpty
                                        ? null
                                        : nameController.text,
                                    website: websiteController.text.isEmpty
                                        ? null
                                        : websiteController.text,
                                    file: img,
                                  ),
                                );
                          },
                          color: colorScheme.onBackground,
                          height: size.maxHeight * 0.08,
                          size: size,
                          child: state.apiState == ApiState.loading
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                  child: Text(
                                    LocaleStrings.editProfileSaveButton,
                                    style: textTheme.displayMedium?.copyWith(
                                      color: colorScheme.background,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                    SizedBox(height: size.maxHeight * 0.06),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<Uint8List?> pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.readAsBytes();
    }
    return null;
  }
}
