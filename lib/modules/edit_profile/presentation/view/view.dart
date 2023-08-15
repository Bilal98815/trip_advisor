import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/edit_profile/data/edit_profile_auth.dart';
import 'package:trip_advisor/modules/edit_profile/domain/repository/edit_profile_repository_imp.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_bloc.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_event.dart';
import 'package:trip_advisor/modules/edit_profile/presentation/bloc/edit_profile_state.dart';
import 'package:trip_advisor/modules/profile/data/profile_auth.dart';
import 'package:trip_advisor/modules/profile/domain/repository/profile_repository_imp.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_bloc.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_event.dart';
import 'package:trip_advisor/modules/profile/presentation/bloc/profile_state.dart';

part 'edit_profile_page.dart';
part 'edit_profile_view.dart';
