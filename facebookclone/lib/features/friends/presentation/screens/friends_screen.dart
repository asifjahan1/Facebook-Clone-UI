import 'package:facebookclone/core/constants/app_colors.dart';
import 'package:facebookclone/core/constants/constants.dart';
import 'package:facebookclone/features/friends/presentation/widgets/friends_list.dart';
import 'package:facebookclone/features/friends/presentation/widgets/requests_list.dart';
import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: Constants.defaultPadding,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                'Requests',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            RequestsList(),
            SliverToBoxAdapter(
              child: Divider(
                height: 50,
                thickness: 3,
                color: Colors.black,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Friends',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            FriendsList(),
          ],
        ),
      ),
    );
  }
}
