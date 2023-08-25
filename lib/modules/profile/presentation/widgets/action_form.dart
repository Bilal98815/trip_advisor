part of 'widgets.dart';

class ActionForm extends StatelessWidget {
  const ActionForm({
    required this.onTap,
    required this.size,
    required this.isTextWidget,
    required this.buttonText,
    required this.number,
    required this.actionTitle,
    super.key,
  });

  final int number;
  final String actionTitle;
  final VoidCallback onTap;
  final BoxConstraints size;
  final bool isTextWidget;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.maxHeight * 0.05,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$number $actionTitle',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        SizedBox(
          height: size.maxHeight * 0.08,
        ),
        if (isTextWidget)
          Text(
            'You have no $actionTitle yet.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                ),
          )
        else
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return SizedBox(
                height: size.maxHeight * 0.18,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.user?.photos?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.maxWidth * 0.008,
                      ),
                      child: SizedBox(
                        height: size.maxHeight * 0.14,
                        width: size.maxWidth * 0.4,
                        child: CachedNetworkImage(
                          imageUrl: state.user?.photos?[index].toString() ?? '',
                          imageBuilder: (context, imageProvider) => Container(
                            height: size.maxHeight,
                            width: size.maxWidth,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        SizedBox(
          height: size.maxHeight * 0.09,
        ),
        PrimaryButton(
          ignoring: false,
          onTap: onTap,
          color: Theme.of(context).colorScheme.background,
          height: size.maxHeight * 0.075,
          size: size,
          child: Center(
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
        SizedBox(
          height: size.maxHeight * 0.06,
        ),
        const Divider(),
      ],
    );
  }
}
