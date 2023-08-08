import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/common_text_widget.dart';
import '../widgets/support_tile.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        leading: LayoutBuilder(builder: (context, size) {
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
        }),
        title: const CommonText(
            text: 'Support',
            color: Colors.white,
            fontsize: 20,
            fontWeight: FontWeight.w600),
      ),
      body: SafeArea(child: LayoutBuilder(builder: (context, size) {
        return Container(
          width: size.maxWidth,
          height: size.maxHeight,
          color: Colors.black87,
          padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.pop(context);
              //         },
              //         child: const Icon(
              //           Icons.arrow_back_ios_new,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //     const Spacer(),
              //     const CommonText(
              //         text: 'Support',
              //         color: Colors.white,
              //         fontsize: 20,
              //         fontWeight: FontWeight.w600),
              //     const Spacer(
              //       flex: 2,
              //     ),
              //   ],
              // ),
              SizedBox(
                height: size.maxHeight * 0.05,
              ),
              SupportTile(onTap: () {}, size: size, title: 'Help center'),
              SizedBox(
                height: size.maxHeight * 0.03,
              ),
              SupportTile(onTap: () {}, size: size, title: 'App feedback'),
              SizedBox(
                height: size.maxHeight * 0.03,
              ),
              SupportTile(onTap: () {}, size: size, title: 'Privacy policy'),
              SizedBox(
                height: size.maxHeight * 0.03,
              ),
              SupportTile(onTap: () {}, size: size, title: 'Terms of use'),
              SizedBox(
                height: size.maxHeight * 0.03,
              ),
              SupportTile(
                  onTap: () {}, size: size, title: 'Open source licenses'),
            ],
          ),
        );
      })),
    );
  }
}
