part of 'widgets.dart';

class TripsView extends StatelessWidget {
  TripsView({required this.size, super.key});

  final BoxConstraints size;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.maxHeight * 0.06,
        ),
        TripGuidanceTile(
          size: size,
          image: ImagePath().getPathByTheme(context, 'heart.png'),
          text: LocaleStrings.tripsTabFavouritePlace,
        ),
        SizedBox(
          height: size.maxHeight * 0.03,
        ),
        TripGuidanceTile(
          size: size,
          image: ImagePath().getPathByTheme(context, 'placeholder.png'),
          text: LocaleStrings.tripsTabLocation,
        ),
        SizedBox(
          height: size.maxHeight * 0.03,
        ),
        TripGuidanceTile(
          size: size,
          image: ImagePath().getPathByTheme(context, 'document.png'),
          text: LocaleStrings.tripsTabNotes,
        ),
        SizedBox(
          height: size.maxHeight * 0.03,
        ),
        TripGuidanceTile(
          size: size,
          image: ImagePath().getPathByTheme(context, 'follow.png'),
          text: LocaleStrings.tripsTabShare,
        ),
        SizedBox(
          height: size.maxHeight * 0.05,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleStrings.tripsTabFieldTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: size.maxHeight * 0.01,
              ),
              TextFormField(
                controller: controller,
                onChanged: (val) {
                  context
                      .read<PlanTripBloc>()
                      .add(UpdateTripName(tripName: controller.text));
                },
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                decoration: InputDecoration(
                  hintText: LocaleStrings.tripsTabFieldHint,
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.normal,
                      ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.maxHeight * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.06),
          child: BlocBuilder<PlanTripBloc, PlanTripState>(
            builder: (context, state) {
              return CreateTripButton(
                onTap: () {
                  if (controller.text != '') {}
                },
                height: size.maxHeight * 0.075,
                color: controller.text == ''
                    ? Theme.of(context).disabledColor
                    : Theme.of(context).colorScheme.onBackground,
                child: Center(
                  child: Text(
                    LocaleStrings.tripsTabButton,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: controller.text == ''
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
