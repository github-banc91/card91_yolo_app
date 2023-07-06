import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yolo/screens/user_info_screen.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/screens/widgets/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class ScanAndPay extends ConsumerStatefulWidget {
  const ScanAndPay({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanAndPayState();
}

class _ScanAndPayState extends ConsumerState<ScanAndPay>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController searchController;
  int _currentSelection = 1;
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();
  int currentIndex = 0;

  _selectedItem(int id) {
    _currentSelection = id;
    GlobalKey selectedGlobalKey = GlobalKey();
    switch (id) {
      case 1:
        selectedGlobalKey = _key1;
        break;
      case 2:
        selectedGlobalKey = _key2;
        break;
      case 3:
        selectedGlobalKey = _key3;
        break;
      default:
    }
    _setWidgetPositionx(selectedGlobalKey);
    setState(() {});
  }

  _setWidgetPositionx(GlobalKey selectedKey) {
    final RenderBox widgetRenderBox =
        selectedKey.currentContext!.findRenderObject() as RenderBox;
    final widgetPosition = widgetRenderBox.localToGlobal(Offset.zero);
    final widthSize = widgetRenderBox.size;
  }

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });

    searchController = TextEditingController();
  }

  int page = 1;

  bool isExpanded = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    var maximumHeight = MediaQuery.of(context).size.height;
    var minimumHeight = MediaQuery.of(context).size.height * 0.25;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SlidingUpPanel(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isExpanded ? 0 : 25.0),
              topRight: Radius.circular(isExpanded ? 0 : 25.0),
            ),
            controller: panelController,
            maxHeight: maximumHeight,
            minHeight: minimumHeight,
            onPanelClosed: () {
              setState(() {
                isExpanded = false;
              });
            },
            onPanelSlide: (_) {
              setState(() {
                isExpanded = true;
              });
            },
            panelBuilder: (scrollController) =>
                buildSlidingPanel(scrollController),
            body: Column(
              children: [
                Expanded(
                  child: _buildQrView(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSlidingPanel(ScrollController sc) => MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            getSize(height: isExpanded ? 50 : 15),
            if (!isExpanded)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/up arrow.svg',
                  ),
                ],
              ),
            if (!isExpanded) getSize(height: 20),
            if (isExpanded)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = false;
                          });
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.blackFont,
                        ),
                      ),
                      Text(
                        'Send money',
                        style: Poppins.bold(AppColors.blackFont).s18,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.add_circle_rounded,
                      size: 30,
                      color: AppColors.blackFont,
                    ),
                  ),
                ],
              ),
            getSize(height: 20),
            SizedBox(
              height: 45,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: isExpanded
                        ? const Icon(Icons.search)
                        : const SizedBox.shrink(),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.greyFont,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(isExpanded ? 45 : 12),
                    ),
                  ),
                  maxLength: 10,
                  onFieldSubmitted: (data) {},
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
            getSize(height: 20),
            if (!isExpanded)
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 8,
                  padding: const EdgeInsets.all(15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            UserInfoScreen.route,
                          );
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              maxRadius: 25,
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/250?image=2$i',
                              ),
                            ),
                            getSize(height: 10),
                            Text(
                              'John dew',
                              style: Poppins.semiBold(AppColors.blackFont).s14,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            if (isExpanded)
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteBgColor,
                        ),
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width / 1.0,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              key: _key1,
                              onTap: () => _selectedItem(1),
                              child: Container(
                                height: 40,
                                width: 110,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: _currentSelection == 1
                                      ? AppColors.blackFont
                                      : AppColors.greyFont.withOpacity(0.7),
                                ),
                                child: Text(
                                  'Recent',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.whiteBgColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              key: _key2,
                              onTap: () => _selectedItem(2),
                              child: Container(
                                height: 40,
                                width: 110,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: _currentSelection == 2
                                      ? AppColors.blackFont
                                      : AppColors.greyFont.withOpacity(0.7),
                                ),
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.whiteBgColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              key: _key3,
                              onTap: () => _selectedItem(3),
                              child: Container(
                                height: 40,
                                width: 110,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: _currentSelection == 3
                                      ? AppColors.blackFont
                                      : AppColors.greyFont.withOpacity(0.7),
                                ),
                                child: Text(
                                  'Favorites',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.whiteBgColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  returnPage(_currentSelection),
                ],
              ),
          ],
        ),
      );

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.21),
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.grey,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 0.1,
          overlayColor: AppColors.greyFont,
          cutOutSize: scanArea,
        ),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget returnPage(currentTab) {
    switch (currentTab ?? 1) {
      case 1:
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: listShow(),
        );
      case 2:
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: listShow(),
        );
      case 3:
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: listShow(),
        );
      default:
        return Container();
    }
  }

  Widget listShow() {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          UserInfoScreen.route,
        );
      },
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://i.pravatar.cc/50',
        ),
      ),
      title: Text(
        'John dew',
        style: Poppins.semiBold(AppColors.blackFont).s14,
      ),
      subtitle: Text(
        'Tuesday, 29 Nov 2021',
        style: Poppins.regular(AppColors.blackFont.withOpacity(0.7)).s12,
      ),
      trailing: const IconButton(
        onPressed: null,
        icon: Icon(Icons.star_border_outlined),
      ),
    );
  }
}
