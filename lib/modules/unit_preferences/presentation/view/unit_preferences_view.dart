part of 'view.dart';

class UnitPreferencesView extends StatelessWidget {
  const UnitPreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final List<Units> units = Units.values.toList();

    return BottomSheet(
      onClosing: () {},
      showDragHandle: true,
      shape: const ContinuousRectangleBorder(),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(LocaleStrings.unitsTitle, style: textTheme.labelSmall),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 100),
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) => UnitTile(units: units[index]),
              itemCount: units.length,
            ),
          )
        ],
      ),
    );
  }
}
