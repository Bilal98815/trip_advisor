import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/common/widgets/authentication_button.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/bloc/plan_trip_bloc.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/bloc/plan_trip_event.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/bloc/plan_trip_state.dart';
import 'package:trip_advisor/modules/plan_trip/presentation/widgets/trip_guidance_tile.dart';

import '../../../../common/widgets/common_text_widget.dart';

class TripsView extends StatelessWidget {
  final BoxConstraints size;

  TripsView({required this.size, super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.maxHeight * 0.06,
        ),
        TripGuidanceTile(
            size: size,
            image: 'assets/heart.png',
            text: 'Save places you\'d like to visit'),
        SizedBox(
          height: size.maxHeight * 0.03,
        ),
        TripGuidanceTile(
            size: size,
            image: 'assets/placeholder.png',
            text: 'See your saves on a map'),
        SizedBox(
          height: size.maxHeight * 0.03,
        ),
        TripGuidanceTile(
            size: size,
            image: 'assets/document.png',
            text: 'Keep track of notes, links, and more'),
        SizedBox(
          height: size.maxHeight * 0.03,
        ),
        TripGuidanceTile(
            size: size,
            image: 'assets/follow.png',
            text: 'Share and collaborate on your plans'),
        SizedBox(
          height: size.maxHeight * 0.05,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Trip name?',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: size.maxHeight * 0.01,
              ),
              TextFormField(
                controller: controller,
                onChanged: (val) {
                  context
                      .read<PlanTripBloc>()
                      .add(UpdateTripName(tripName: controller.text));
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Ex: Weekend in NYC',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.maxHeight * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.06),
          child: BlocBuilder<PlanTripBloc, PlanTripState>(
              builder: (context, state) {
            return AuthenticationButton(
                onTap: () {},
                color: state.tripName == '' ? Colors.grey : Colors.white,
                height: size.maxHeight * 0.075,
                size: size,
                child: Center(
                  child: CommonText(
                      text: 'Create a Trip',
                      color:
                          state.tripName == '' ? Colors.grey : Colors.black87,
                      fontsize: 17,
                      fontWeight: FontWeight.w500),
                ));
          }),
        )
      ],
    );
  }
}
