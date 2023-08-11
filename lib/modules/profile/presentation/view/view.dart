import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/modules/edit_profile/edit_profile.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_bloc.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_event.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_state.dart';
import 'package:trip_advisor/modules/profile/presentation/widgets/action_form.dart';
import 'package:trip_advisor/modules/profile/presentation/widgets/more_options_tile.dart';
import 'package:trip_advisor/modules/profile/presentation/widgets/perosnal_details_tile.dart';
import 'package:url_launcher/url_launcher.dart';

part 'profile_view.dart';
