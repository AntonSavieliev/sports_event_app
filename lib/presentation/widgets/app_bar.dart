import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports_event_app/presentation/core/app_colors.dart';

class SportsEventAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SportsEventAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
        width: 72,
        height: 48,
      ),
      centerTitle: true,
      backgroundColor: AppColors.appBarBackgroundColor,
      automaticallyImplyLeading: false,
    );
  }
}
