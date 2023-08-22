part of 'view.dart';

class LocationDataView extends StatelessWidget {
  const LocationDataView({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.maxHeight * 0.07),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.maxWidth * 0.03),
                  child: Container(
                    width: size.maxWidth * 0.25,
                    height: size.maxHeight * 0.09,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kLightRed,
                    ),
                    child: Center(
                      child: Image.asset(
                        ImagePath().getPathByTheme(context, 'location.png'),
                        width: size.maxWidth * 0.1,
                        height: size.maxHeight * 0.07,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.maxHeight * 0.04),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                  child: Text(
                    LocaleStrings.locationDataHeading,
                    style: textTheme.titleLarge,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.maxHeight * 0.3),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                  child: PrimaryButton(
                    ignoring: false,
                    onTap: () async {
                      await getLocation(context);

                      if (context.mounted) {
                        context.goNamed(
                          UserDataPage.routeName,
                          extra: {'email': email, 'password': password},
                        );
                      }
                    },
                    height: size.maxHeight * 0.064,
                    color: colorScheme.onBackground,
                    size: size,
                    child: Center(
                      child: Text(
                        LocaleStrings.locationDataAllow,
                        style: textTheme.displayMedium?.copyWith(
                          color: colorScheme.background,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.maxHeight * 0.05),
                Center(
                  child: InkWell(
                    onTap: () => context.goNamed(
                      UserDataPage.routeName,
                      extra: {'email': email, 'password': password},
                    ),
                    child: Text(
                      LocaleStrings.locationDataNotNow,
                      style: textTheme.titleSmall?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> getLocation(BuildContext context) async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );

    debugPrint('------ Position: $position');

    context.read<LocationDataBloc>().add(
          LocationDataEvent(
            location: GeoPoint(position.latitude, position.longitude),
            email: email,
          ),
        );
  }
}
