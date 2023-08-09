import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_event.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_state.dart';

import '../../../../common/widgets/common_text_widget.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../profile/presentation/bloc/profile_event.dart';
import '../../../profile/presentation/bloc/profile_state.dart';

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
    BlocProvider.of<ProfileBloc>(context).add(GetUserEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: LayoutBuilder(builder: (context, size) {
          return Padding(
            padding: EdgeInsets.only(left: size.maxWidth * 0.5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          );
        }),
        title: const CommonText(
            text: 'Edit profile',
            color: Colors.white,
            fontsize: 20,
            fontWeight: FontWeight.w600),
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, size) {
          return Container(
            width: size.maxWidth,
            height: size.maxHeight,
            color: Colors.black87,
            padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  Container(
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
                              backgroundImage: AssetImage('assets/mine.jpg'),
                            );
                          }
                        }),
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
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                  size: 17,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Name',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: size.maxHeight * 0.01,
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                        return TextFormField(
                          controller: nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: state.user?.name ?? 'Name',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        );
                      }),
                      SizedBox(
                        height: size.maxHeight * 0.03,
                      ),
                      const Text('Current city',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: size.maxHeight * 0.01,
                      ),
                      Container(
                          width: size.maxWidth,
                          height: size.maxHeight * 0.08,
                          padding: EdgeInsets.symmetric(
                              vertical: size.maxHeight * 0.01,
                              horizontal: size.maxWidth * 0.03),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.grey)),
                          child: BlocBuilder<EditProfileBloc, EditProfileState>(
                            builder: (context, state) {
                              debugPrint('---->> Country: ${state.country}');
                              return DropdownButton(
                                icon: const SizedBox.shrink(),
                                underline: const SizedBox.shrink(),
                                //value: state.country,
                                hint: Text(
                                  state.country,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
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
                                      '---->> Country: ${state.country}');
                                },
                              );
                            },
                          )),
                      SizedBox(
                        height: size.maxHeight * 0.03,
                      ),
                      const Text('Website',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: size.maxHeight * 0.01,
                      ),
                      TextFormField(
                        controller: websiteController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Add a website',
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.03,
                      ),
                      const Text('About you',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: size.maxHeight * 0.01,
                      ),
                      Container(
                        height: size.maxHeight * 0.23,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.grey)),
                        padding: EdgeInsets.symmetric(
                            vertical: size.maxHeight * 0.005,
                            horizontal: size.maxWidth * 0.03),
                        child: TextFormField(
                          controller: aboutController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          onChanged: (val) {
                            context
                                .read<EditProfileBloc>()
                                .add(UpdateCountEvent(count: val.length));
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Write some details about yourself',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.01,
                      ),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                          builder: (context, state) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: CommonText(
                              text: '${state.count}/160',
                              color: Colors.white,
                              fontsize: 12,
                              fontWeight: FontWeight.w400),
                        );
                      })
                    ],
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.09,
                  ),
                  BlocConsumer<EditProfileBloc, EditProfileState>(
                      listener: (context, state) {
                    if (state.apiState == ApiState.saved) {
                      context.read<ProfileBloc>().add(GetUserEvent());
                      Navigator.pop(context);
                    } else if (state.apiState == ApiState.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Something went wrong!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  }, builder: (context, state) {
                    return PrimaryButton(
                        ignoring: state.apiState == ApiState.loading,
                        onTap: () {
                          context.read<EditProfileBloc>().add(UpdateUserEvent(
                              bio: aboutController.text.isEmpty
                                  ? null
                                  : aboutController.text,
                              name: nameController.text.isEmpty
                                  ? null
                                  : nameController.text,
                              website: websiteController.text.isEmpty
                                  ? null
                                  : websiteController.text,
                              file: img));
                        },
                        color: Colors.white,
                        height: size.maxHeight * 0.08,
                        size: size,
                        child: state.apiState == ApiState.loading
                            ? const Center(child: CircularProgressIndicator())
                            : const Center(
                                child: CommonText(
                                    text: 'Save',
                                    color: Colors.black,
                                    fontsize: 18,
                                    fontWeight: FontWeight.w500),
                              ));
                  }),
                  SizedBox(
                    height: size.maxHeight * 0.06,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<Uint8List?> pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return await image.readAsBytes();
    }
  }
}
