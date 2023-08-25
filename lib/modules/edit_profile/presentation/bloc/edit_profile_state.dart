part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.count = 0,
    this.country = 'Search',
    this.apiState = ApiState.idle,
    this.isLoading = false,
  });
  @override
  List<Object?> get props => [count, country, isLoading, apiState];

  final int count;
  final String country;
  final bool isLoading;
  final ApiState apiState;

  EditProfileState copyWith({
    int? count,
    String? country,
    ApiState? apiState,
    bool? isLoading,
  }) {
    return EditProfileState(
      count: count ?? this.count,
      country: country ?? this.country,
      apiState: apiState ?? this.apiState,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
