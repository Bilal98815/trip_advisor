import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/explore/presentation/view/explore_view.dart';
import 'package:trip_advisor/modules/login/presentation/bloc/login_bloc.dart';
import 'package:trip_advisor/modules/login/presentation/bloc/login_event.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_bloc.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_bloc_state.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_event.dart';

class UserDataView extends StatelessWidget {

  UserDataView({super.key, required this.email, required this.password});
  final String email;
  final String password;

  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<String> items = [
    'UK',
    'America',
    'Canada',
    'Australia',
    'Pakistan'
  ];

  static const routeName = 'userData';
  static String route() => '/onboarding/signup/locationData/userData';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formKey,
        child: LayoutBuilder(builder: (context, size) {
          return Container(
            width: size.maxWidth,
            height: size.maxHeight,
            color: Colors.black87,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.maxHeight * 0.07,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.03),
                    child: Container(
                      width: size.maxWidth * 0.3,
                      height: size.maxHeight * 0.1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade300,),
                      child: Center(
                          child: Image.asset(
                        'assets/man.png',
                        width: size.maxWidth * 0.15,
                        height: size.maxHeight * 0.07,
                      ),),
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                    child: const CommonText(
                        text:
                            "Let's get the basics so we can give you the goods.",
                        color: Colors.white,
                        textOverflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                        fontsize: 31,
                        fontWeight: FontWeight.w800,),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('What should we call you?',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,),),
                        SizedBox(
                          height: size.maxHeight * 0.01,
                        ),
                        TextFormField(
                          controller: nameController,
                          validator: (val) =>
                              val!.isEmpty ? 'Enter name!' : null,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(8),),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Where do you live?(Optional)',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,),),
                        SizedBox(
                          height: size.maxHeight * 0.01,
                        ),
                        Container(
                            width: size.maxWidth,
                            height: size.maxHeight * 0.08,
                            padding: EdgeInsets.symmetric(
                                vertical: size.maxHeight * 0.01,
                                horizontal: size.maxWidth * 0.03,),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.grey),),
                            child: BlocBuilder<UserDataBloc, UserDataBlocState>(
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
                                        fontWeight: FontWeight.w500,),
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
                                    context.read<UserDataBloc>().add(
                                        UpdateCountryEvent(country: value!),);
                                    context.read<UserDataBloc>().add(
                                        StoreCountryDB(
                                            country: value, email: email,),);
                                    debugPrint(
                                        '---->> Selected Country: $value',);
                                    debugPrint(
                                        '---->> Country: ${state.country}',);
                                  },
                                );
                              },
                            ),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,),
                      child: BlocBuilder<UserDataBloc, UserDataBlocState>(
                        builder: (context, state) {
                          return PrimaryButton(
                              ignoring: false,
                              onTap: () {
                                if (!formKey.currentState!.validate()) {
                                  debugPrint('------Enter Name');
                                } else {
                                  context
                                      .read<UserDataBloc>()
                                      .add(UpdateNameEvent(
                                        name: nameController.text,
                                        email: email,
                                      ),);
                                  context.read<LoginBloc>().add(OnLoginEvent(
                                        email: email,
                                        password: password,
                                      ),);
                                  context.go(ExploreView.route());
                                }
                              },
                              height: size.maxHeight * 0.064,
                              color: Colors.white,
                              size: size,
                              child: const Center(
                                child: CommonText(
                                    text: 'Next',
                                    color: Colors.black87,
                                    fontsize: 20,
                                    fontWeight: FontWeight.w500,),
                              ),);
                        },
                      ),),
                  SizedBox(
                    height: size.maxHeight * 0.05,
                  ),
                ],
              ),
            ),
          );
        },),
      ),),
    );
  }
}
