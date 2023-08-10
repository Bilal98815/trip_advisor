import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_bloc.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_state.dart';

class ActionForm extends StatelessWidget {
  const ActionForm({
    required this.onTap,
    required this.size,
    required this.isTextWidget,
    required this.buttonText,
    required this.number,
    required this.actionTitle,
    super.key,
  });
  final int number;
  final String actionTitle;
  final Function onTap;
  final BoxConstraints size;
  final bool isTextWidget;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.maxHeight * 0.05,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CommonText(
            text: '$number $actionTitle',
            color: Colors.white,
            fontsize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: size.maxHeight * 0.08,
        ),
        if (isTextWidget)
          CommonText(
            text: 'You have no $actionTitle yet.',
            color: Colors.white,
            fontsize: 14,
            fontWeight: FontWeight.w400,
          )
        else
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return SizedBox(
                height: size.maxHeight * 0.18,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.user?.photos?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.008,
                      ),
                      child: Container(
                        width: size.maxWidth * 0.4,
                        height: size.maxHeight * 0.14,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          image: DecorationImage(
                            image: NetworkImage(
                              state.user?.photos?[index].toString() ?? '',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        SizedBox(
          height: size.maxHeight * 0.09,
        ),
        PrimaryButton(
          ignoring: false,
          onTap: onTap,
          color: Colors.black12,
          height: size.maxHeight * 0.075,
          size: size,
          child: Center(
            child: CommonText(
              text: buttonText,
              color: Colors.white,
              fontsize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: size.maxHeight * 0.06,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.4,
        ),
      ],
    );
  }
}
