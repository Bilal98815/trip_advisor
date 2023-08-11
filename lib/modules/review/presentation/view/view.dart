import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_bloc.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_event.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_state.dart';
import 'package:trip_advisor/modules/review/presentation/bloc/review_bloc.dart';
import 'package:trip_advisor/modules/review/presentation/bloc/review_event.dart';
import 'package:trip_advisor/modules/review/presentation/bloc/review_state.dart';
import 'package:trip_advisor/modules/review/presentation/widgets/action_button.dart';
import 'package:trip_advisor/modules/review/presentation/widgets/image_container.dart';
import 'package:trip_advisor/modules/review/presentation/widgets/missing_place_button.dart';
import 'package:url_launcher/url_launcher.dart';

part 'review_page.dart';
part 'review_view.dart';
