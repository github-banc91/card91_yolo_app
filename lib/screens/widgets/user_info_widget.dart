import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/screens/widgets/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 5),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://i.pravatar.cc/500',
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/icons/check icon.png',
              ),
            ],
          ),
        ),
        getSize(height: 15),
        Text(
          'Elisa bsd',
          style: Poppins.regular(AppColors.blackFont).s22,
        ),
        getSize(height: 15),
        Text(
          'Acc No : 8u4t3u4i993940',
          style: Poppins.regular(const Color(0xffA5A5A5)).s18,
        ),
        getSize(height: 15),
        Text(
          'On Yolo Pay Since Jul 22',
          style: Poppins.regular(const Color(0xff000000)).s13,
        ),
      ],
    );
  }
}
