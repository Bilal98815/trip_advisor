import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/explore/explore.dart';
import 'package:trip_advisor/modules/login/login.dart';
import 'package:trip_advisor/modules/user_data/data/user_data_auth.dart';
import 'package:trip_advisor/modules/user_data/domain/repository/user_data_repository_imp.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_bloc.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_bloc_state.dart';
import 'package:trip_advisor/modules/user_data/presentation/bloc/user_data_event.dart';

part 'user_data_page.dart';
part 'user_data_view.dart';
