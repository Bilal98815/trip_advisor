part of 'view.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  static const routeName = 'support';
  static String route() => '/account/support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: LayoutBuilder(
          builder: (context, size) {
            return Padding(
              padding: EdgeInsets.only(left: size.maxWidth * 0.5),
              child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        title: CommonText(
          text: LocaleStrings.supportTitle,
          color: Colors.white,
          fontsize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Container(
              width: size.maxWidth,
              height: size.maxHeight,
              color: Colors.black87,
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
