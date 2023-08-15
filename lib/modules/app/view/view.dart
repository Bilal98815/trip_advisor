import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/easy_localization.dart';
import 'package:trip_advisor/common/router/router.dart';
import 'package:trip_advisor/modules/account/data/account_auth.dart';
import 'package:trip_advisor/modules/account/domain/repository/account_repository_imp.dart';
import 'package:trip_advisor/modules/account/presentation/bloc/account_bloc.dart';
import 'package:trip_advisor/modules/login/data/login_auth_service.dart';
import 'package:trip_advisor/modules/login/domain/repository/login_repository_imp.dart';
import 'package:trip_advisor/modules/login/presentation/bloc/login_bloc.dart';

part 'trip_advisor_app.dart';
part 'trip_advisor_app_view.dart';
