import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/location_data/location_data.dart';
import 'package:trip_advisor/modules/location_data/presentation/bloc/location_data_bloc.dart';
import 'package:trip_advisor/modules/user_data/presentation/view/view.dart';

part 'location_data_view.dart';
part 'location_data_page.dart';
