import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/location_data/presentation/view/location_data_view.dart';
import 'package:trip_advisor/modules/login/presentation/view/login_view.dart';
import 'package:trip_advisor/modules/signup/data/signup_auth_service.dart';
import 'package:trip_advisor/modules/signup/domain/repository/signup_repository_imp.dart';
import 'package:trip_advisor/modules/signup/presentation/bloc/signup_bloc.dart';
import 'package:trip_advisor/modules/signup/presentation/bloc/signup_bloc_state.dart';
import 'package:trip_advisor/modules/signup/presentation/bloc/signup_event.dart';
import 'package:trip_advisor/modules/signup/presentation/widgets/password_rules_widget.dart';

part 'signup_page.dart';
part 'signup_view.dart';
