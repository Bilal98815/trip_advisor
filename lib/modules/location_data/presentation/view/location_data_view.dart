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
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Container(
              width: size.maxWidth,
              height: size.maxHeight,
              color: Colors.black87,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.maxHeight * 0.07,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.03),
                    child: Container(
                      width: size.maxWidth * 0.25,
                      height: size.maxHeight * 0.09,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFCBC4),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/location.png',
                          width: size.maxWidth * 0.1,
                          height: size.maxHeight * 0.07,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.04,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                    child: CommonText(
                      text: LocaleStrings.locationDataHeading,
                      color: Colors.white,
                      textOverflow: TextOverflow.clip,
                      textAlign: TextAlign.left,
                      fontsize: 31,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.3,
                  ),
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
                            extra: {
                              'email': email,
                              'password': password,
                            },
                          );
                        }
                      },
                      height: size.maxHeight * 0.064,
                      color: Colors.white,
                      size: size,
                      child: Center(
                        child: CommonText(
                          text: LocaleStrings.locationDataAllow,
                          color: Colors.black87,
                          fontsize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.05,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => context.goNamed(
                        UserDataPage.routeName,
                        extra: {'email': email, 'password': password},
                      ),
                      child: Text(
                        LocaleStrings.locationDataNotNow,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
