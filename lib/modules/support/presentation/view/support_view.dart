part of 'view.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  static const routeName = 'support';
  static String route() => '/account/support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Support',
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Container(
              width: size.maxWidth,
              height: size.maxHeight,
              color: Theme.of(context).colorScheme.background,
              padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.maxHeight * 0.05,
                  ),
                  SupportTile(
                    onTap: () {},
                    size: size,
                    title: LocaleStrings.supportHelpCenter,
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  SupportTile(
                    onTap: () {},
                    size: size,
                    title: LocaleStrings.supportAppFeedback,
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  SupportTile(
                    onTap: () {},
                    size: size,
                    title: LocaleStrings.supportPrivacyPolicy,
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  SupportTile(
                    onTap: () {},
                    size: size,
                    title: LocaleStrings.supportTerms,
                  ),
                  SizedBox(
                    height: size.maxHeight * 0.03,
                  ),
                  SupportTile(
                    onTap: () {},
                    size: size,
                    title: LocaleStrings.supportLicenses,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
