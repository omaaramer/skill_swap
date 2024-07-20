import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/skill_swap.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey,
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          centerTitle: true,
          title: Text("Home Page", style: AppStyle.styleBold26(context)),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Swap, learn, grow",
                  style: AppStyle.styleBold26(context)),
            ),
            const SizedBox(height: 20),
            const PostCard(),
            const PostCard(),
            const PostCard(),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        height: 520,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text("Omar Amer", style: AppStyle.styleBold18(context)),
              subtitle: Text("Cairo, Egypt",
                  style: AppStyle.styleRegular16Grey(context)),
              trailing: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(Assets.imagesOmaar)),
                ),
              ),
            ),
            Container(
              height: 380,
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Colors.grey, // Set the border color
                    width: 1, // Set the border width
                  ),
                ),
              ),
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(Assets.imagesDownload),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("wILL TEACH YOU",
                                style: AppStyle.styleBold18(context)),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.primary,
                              ),
                              child: Text(
                                "ONLINE",
                                style: AppStyle.stylerBold20(context)
                                    .copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        subtitle: const Text(
                          "Flutter  programming language dart programming language dart",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 20,
                        indent: 20,
                        height: 20,
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("IN EXHCANGE FOR",
                                style: AppStyle.styleBold18(context)),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.primary,
                              ),
                              child: Text(
                                "IN PERSON",
                                style: AppStyle.stylerBold20(context)
                                    .copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        subtitle: const Text(
                          "Flutter  programming language dart",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.grey.shade300,
                      ),
                      onPressed: () {},
                      child: Image.asset(
                          color: AppColors.primary, Assets.imagesSaveIcon)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.grey.shade300,
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      Assets.imagesSwapIcon,
                      color: AppColors.primary,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.grey.shade300,
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      Assets.imagesMessageIcon,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Sign Out"),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              Get.offAllNamed(Routes.signInScreen);
            },
          ),
        ],
      ),
    );
  }
}
