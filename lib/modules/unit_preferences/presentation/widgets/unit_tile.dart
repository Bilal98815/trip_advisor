part of 'widgets.dart';

class UnitTile extends StatelessWidget {
  const UnitTile({super.key, required this.units});

  final Units units;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PreferencesBloc>().add(PreferencesUnitsChanged(units));
        context.pop();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(units.unit.toString()),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
