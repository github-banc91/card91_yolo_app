// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:yolo/utils/app_colors.dart';
// import 'package:yolo/utils/view_model.dart';

// class LoadingIndicator extends StatelessWidget {
//   const LoadingIndicator({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: AppColors.blueColor,
//         borderRadius: BorderRadius.circular(8),
//       ), // Dialog background
//       child: CircularProgressIndicator(
//         color: AppColors.whiteColor,
//       ),
//     );
//   }
// }

// class LoadingIndicatorConsumer<V extends ViewModel> extends StatelessWidget {
//   const LoadingIndicatorConsumer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       child: Selector<V, bool>(
//         selector: (_, V state) => state.isLoading,
//         builder: (_, bool isLoading, __) => isLoading
//             ? const Center(child: LoadingIndicator())
//             : const SizedBox.shrink(),
//       ),
//     );
//   }
// }
