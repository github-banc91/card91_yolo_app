import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mpin_fingerprint_screen.dart';
import 'package:yolo/screens/refer/refer_a_user_screen.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class TopCard extends StatelessWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        top: 80,
      ),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home top card.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: AppColors.blackFont,
                      ),
                      onPressed: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          transitionDuration: Duration(milliseconds: 300),
                          barrierLabel:
                              MaterialLocalizations.of(context).dialogLabel,
                          barrierColor: Colors.black.withOpacity(0.5),
                          pageBuilder: (context, _, __) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(45),
                                    bottomRight: Radius.circular(45),
                                  ),
                                  child: Card(
                                    // width: MediaQuery.of(context).size.width,
                                    // padding: const EdgeInsets.all(25),

                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 60,
                                        left: 25.0,
                                        right: 25,
                                        bottom: 30,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Shivansh Agrawal',
                                                style: Poppins.bold().s14,
                                              ),
                                              const CircleAvatar(
                                                minRadius: 35,
                                                backgroundImage: NetworkImage(
                                                  'https://picsum.photos/250?image=32',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Minimum KYC',
                                            style: Poppins.regular().s14,
                                          ),
                                          getSize(height: 20),
                                          Text(
                                            '08/2022',
                                            style: Poppins.bold().s14,
                                          ),
                                          getSize(height: 5),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                size: 15,
                                                color: AppColors.greenColor,
                                              ),
                                              getSize(width: 5),
                                              Text(
                                                'Joined',
                                                style: Poppins.regular(
                                                  AppColors.blackFont,
                                                ).s14,
                                              ),
                                            ],
                                          ),
                                          commonTile(
                                            context,
                                            'Refer',
                                            'assets/icons/refer icon.svg',
                                            () {
                                              Navigator.pop(context);
                                              Navigator.pushNamed(
                                                context,
                                                ReferUserScreen.route,
                                              );
                                            },
                                          ),
                                          commonTile(
                                            context,
                                            'My qr code',
                                            'assets/icons/my qr code.svg',
                                            null,
                                          ),
                                          commonTile(
                                            context,
                                            'Yolo wallet',
                                            'assets/icons/yolo wallet.svg',
                                            null,
                                          ),
                                          commonTile(
                                            context,
                                            'Transaction history',
                                            'assets/icons/trans his.svg',
                                            null,
                                          ),
                                          commonTile(
                                            context,
                                            'App settings',
                                            'assets/icons/setting.svg',
                                            null,
                                          ),
                                          commonTile(
                                            context,
                                            'Logout',
                                            'assets/icons/logout.svg',
                                            () {
                                              // Navigator.pushNamedAndRemoveUntil(
                                              //   context,
                                              //   SignInMpinFingerprintScreen
                                              //       .route,
                                              //   (route) => false,
                                              // );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: CurvedAnimation(
                                parent: animation,
                                curve: Curves.linear,
                              ).drive(Tween<Offset>(
                                begin: const Offset(-3, -1.2),
                                end: Offset.zero,
                              )),
                              child: child,
                            );
                          },
                        );
                      })),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://picsum.photos/250?image=32',
                ),
              ),
            ],
          ),
          getSize(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Shivansh !',
                      style: Poppins.bold(AppColors.whiteColor).s14,
                    ),
                    getSize(height: 10),
                    Text(
                      'What do you like to do today?',
                      style: Poppins.regular(AppColors.whiteColor).s12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                height: 160,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/cardd.png',
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset('assets/images/cardy.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget commonTile(context, title, icon, tap) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 20),
      trailing: Icon(
        Icons.arrow_right,
        color: AppColors.blackFont,
      ),
      leading: SvgPicture.asset(
        icon,
      ),
      title: Text(
        title,
        style: Poppins.bold(AppColors.blackFont).s16,
      ),
      onTap: tap,
    );
  }
}
