import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                _topCard(),
                getSize(height: 20),
                _homeOptionsWidget(),
                getSize(height: 15),
                _earnCoinAndOrderPhyCard(),
                getSize(height: 20),
                _recommendationWidget(),
                getSize(height: 20),
                _dealsOfDay(),
                getSize(height: 20),
                _sponsoredWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _topCard() {
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
                          transitionDuration: const Duration(milliseconds: 300),
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
                                          _commonTile(
                                            context,
                                            'Refer',
                                            'assets/icons/refer icon.svg',
                                            () {
                                              Navigator.pop(context);
                                              Navigator.pushNamed(
                                                context,
                                                'ReferUserScreen',
                                              );
                                            },
                                          ),
                                          _commonTile(
                                            context,
                                            'My qr code',
                                            'assets/icons/my qr code.svg',
                                            null,
                                          ),
                                          _commonTile(
                                            context,
                                            'Yolo wallet',
                                            'assets/icons/yolo wallet.svg',
                                            null,
                                          ),
                                          _commonTile(
                                            context,
                                            'Transaction history',
                                            'assets/icons/trans his.svg',
                                            null,
                                          ),
                                          _commonTile(
                                            context,
                                            'App settings',
                                            'assets/icons/setting.svg',
                                            null,
                                          ),
                                          _commonTile(
                                            context,
                                            'Logout',
                                            'assets/icons/logout.svg',
                                            () {
                                              clearCreds(context);
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

  Widget _homeOptionsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _commonContainer(
          'Scan & Pay',
          'assets/icons/scan and pay.svg',
          () {
            Navigator.pushNamed(context, 'ScanAndPay');
          },
        ),
        getSize(width: 20),
        _commonContainer('My Qr', 'assets/icons/my qr.svg', () {
          // ref.read(cardHolderDataProvider);
        }),
        getSize(width: 20),
        _commonContainer('Transaction', 'assets/icons/transfer his.svg', () {
          Navigator.pushNamed(context, 'ScanNpay');
        }),
        getSize(width: 20),
        _commonContainer('Refer', 'assets/icons/refer.svg', () {}),
      ],
    );
  }

  Widget _earnCoinAndOrderPhyCard() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 30, right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff172549),
                    Color(0xff000000),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Earn Yolo Coins Now',
                    style: Poppins.bold(AppColors.whiteColor).s14,
                  ),
                  getSize(height: 10),
                  Text(
                    'Activate',
                    style: Poppins.regular(AppColors.whiteColor).s14,
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/earn coin.png',
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff1B1B1B),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/phy card.svg'),
              getSize(width: 10),
              Text(
                'Order your Physical Card',
                style: Poppins.bold(AppColors.whiteColor).s14,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recommendationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendation',
          style: Poppins.bold(AppColors.blackFont).s20,
        ),
        getSize(height: 20),
        Container(
          padding: const EdgeInsets.all(25),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [
                Color(0xff2D4C9D),
                Color(0xff180909),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Activate your min KYC To start \nusing YOLO',
                style: Poppins.bold(AppColors.whiteColor).s15,
              ),
              getSize(height: 40),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  'Activate now',
                  style: Poppins.bold(AppColors.blackFont).s16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dealsOfDay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              'AllDealsScreen',
            );
          },
          child: Text(
            'Deals of the day',
            style: Poppins.bold(AppColors.blackFont).s20,
          ),
        ),
        // getSize(height: 20),
        Image.asset('assets/images/nyka deal.png'),
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (ctx, i) {
              return Image.asset(
                'assets/images/deal 50%.png',
                width: 160,
                height: 140,
                fit: BoxFit.fill,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _sponsoredWidget() {
    return Container();
    // final sponsorsWatch = ref.watch(getSponsorsListProvider);
    // return sponsorsWatch.when(
    //     data: (data) {
    //       return SizedBox(
    //         width: double.infinity,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Text(
    //               'Sponsored',
    //               style: Poppins.bold(AppColors.blackFont).s20,
    //             ),
    //             getSize(height: 20),
    //             Wrap(
    //               runSpacing: 5,
    //               spacing: 10,
    //               children: [
    //                 for (int i = 0;
    //                     i < List.from(data['allSponsors']).length;
    //                     i++)
    //                   Card(
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       child: Column(
    //                         children: [
    //                           Image.network(
    //                             data['allSponsors'][i]['display_img_url'] ?? '',
    //                             height: 100,
    //                             width: 80,
    //                             errorBuilder: (a, s, _) {
    //                               return Icon(
    //                                 Icons.error,
    //                                 color: AppColors.redError,
    //                               );
    //                             },
    //                           ),
    //                           Text(
    //                             data['allSponsors'][i]['title'] ?? '',
    //                             style: Poppins.bold(AppColors.blackFont).s14,
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //     error: (error, stackTrace) {
    //       String message = '';
    //       // if (error is ErrorMessage) {
    //       //   message = error.message;
    //       // }

    //       return Center(
    //         child: Text(
    //           message,
    //           style: const TextStyle(color: Colors.white, fontSize: 16),
    //         ),
    //       );
    //     },
    //     loading: () => const Center(
    //             child: CircularProgressIndicator(
    //           color: Color(0xFFfa9b6d),
    //         )));
  }

  Widget _commonTile(context, title, icon, tap) {
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

  Widget _commonContainer(title, image, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyCard,
                width: 3,
              ),
              shape: BoxShape.circle,
              color: AppColors.greyTextFormField,
            ),
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              image,
              height: 35,
            ),
          ),
          getSize(height: 10),
          Text(
            title,
            style: Poppins.regular(AppColors.blackFont).s12,
          ),
        ],
      ),
    );
  }

  void clearCreds(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      'SignInMobileScreen',
      (route) => false,
    );
    await Hive.deleteBoxFromDisk('db');
  }
}
