import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';

import 'package:trip_advisor/common/common.dart';

import 'package:trip_advisor/modules/account/account.dart';
import 'package:trip_advisor/modules/app/router/router.dart';
import 'package:trip_advisor/modules/language_preferences/language_preferences.dart';
import 'package:trip_advisor/modules/login/login.dart';
import 'package:trip_advisor/modules/preferences/preferences.dart';

import '../../edit_profile/data/data.dart';
import '../../edit_profile/domain/repository/repository.dart';
import '../../edit_profile/presentation/bloc/edit_profile_bloc.dart';
import '../../explore/data/data.dart';
import '../../explore/domain/repository/repository.dart';
import '../../explore/presentation/bloc/explore_bloc.dart';

part 'trip_advisor_app.dart';
part 'trip_advisor_app_view.dart';
