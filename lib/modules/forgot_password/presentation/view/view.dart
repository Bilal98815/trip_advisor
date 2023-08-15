import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/forgot_password/data/forgot_password_auth.dart';
import 'package:trip_advisor/modules/forgot_password/domain/repository/forgot_password_repository_imp.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc_state.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/widgets/show_dialogue.dart';

part 'forgot_password_page.dart';
part 'forgot_password_view.dart';
