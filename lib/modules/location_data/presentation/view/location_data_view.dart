import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/location_data/presentation/bloc/location_data_bloc.dart';
import 'package:trip_advisor/modules/location_data/presentation/bloc/location_data_event.dart';
import 'package:trip_advisor/modules/user_data/presentation/view/user_data_view.dart';

import '../../../../common/widgets/common_text_widget.dart';

class LocationDataView extends StatelessWidget {
  final String email;
  final String password;

  const LocationDataView(
      {super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(builder: (context, size) {
        return Container(
          width: size.maxWidth,
          height: size.maxHeight,
          color: Colors.black87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.maxHeight * 0.07,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.03),
                child: Container(
                  width: size.maxWidth * 0.25,
                  height: size.maxHeight * 0.09,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFFCBC4)),
                  child: Center(
                      child: Image.asset(
                    'assets/location.png',
                    width: size.maxWidth * 0.1,
                    height: size.maxHeight * 0.07,
                  )),
                ),
              ),
              SizedBox(
                height: size.maxHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                child: const CommonText(
                    text:
                        'Discover traveler recommended spots near you, wherever you are.',
                    color: Colors.white,
                    textOverflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                    fontsize: 31,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: size.maxHeight * 0.3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                child: PrimaryButton(
                    onTap: () async {
                      await getLocation(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDataView(
                                    email: email,
                                    password: password,
                                  )));
                    },
                    height: size.maxHeight * 0.064,
                    color: Colors.white,
                    size: size,
                    child: const Center(
                      child: CommonText(
                          text: 'Allow location data',
                          color: Colors.black87,
                          fontsize: 18,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              SizedBox(
                height: size.maxHeight * 0.05,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDataView(
                                  email: email,
                                  password: password,
                                )));
                  },
                  child: const Text(
                    'Not now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      })),
    );
  }

  getLocation(BuildContext context) async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    debugPrint('------ Position: $position');
    context.read<LocationDataBloc>().add(LocationDataEvent(
        location: GeoPoint(position.latitude, position.longitude),
        email: email));
  }
}
