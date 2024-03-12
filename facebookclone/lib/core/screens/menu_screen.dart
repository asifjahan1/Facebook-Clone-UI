import 'package:facebookclone/core/constants/constants.dart';
import 'package:facebookclone/core/screens/error_screen.dart';
import 'package:facebookclone/core/screens/loader.dart';
import 'package:facebookclone/features/auth/providers/get_user_info_as_stream_by_id_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/menu';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? userId;

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.save;
      case 1:
        return Icons.featured_video_rounded;
      case 2:
        return Icons.people_alt_outlined;
      case 3:
        return Icons.groups_2;
      case 4:
        return Icons.live_tv_rounded;
      case 5:
        return Icons.flag;
      case 6:
        return Icons.watch_later_outlined;
      case 7:
        return Icons.event_available_outlined;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final userInfo = ref.watch(getUserInfoAsStreamByIdProvider(userId!));

        return userInfo.when(
          data: (user) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white60,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: Constants.defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Menu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundImage:
                                            NetworkImage(user.profilePicUrl),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      user.fullName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                const Divider(thickness: 0.35),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add_circle,
                                        size: 35,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Create new Profile or Page',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            for (int i = 0; i < 8; i += 2)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(width: 5),
                                    _buildMenuItem(i),
                                    const SizedBox(width: 5),
                                    _buildMenuItem(i + 1),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  // Handle "See More" button press
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.grey.withOpacity(0.3),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'See more',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(thickness: 0.35),
                            const SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.question_mark_rounded,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Help & Support',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            ),
                            const Divider(thickness: 0.35),
                            const SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.settings_sharp,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Settings & privacy',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            ),
                            const Divider(thickness: 0.35),
                            const SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box_sharp,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Also from Meta',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  // Handle logout here
                                  FirebaseAuth.instance.signOut();
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.grey.withOpacity(0.3),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Log out',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return ErrorScreen(error: error.toString());
          },
          loading: () {
            return const Loader();
          },
        );
      },
    );
  }

  Widget _buildMenuItem(int index) {
    List<String> texts = [
      'Saved',
      'Feeds',
      'Friends',
      'Groups',
      'Video',
      'Pages',
      'Memories',
      'Events',
    ];

    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                _getIconData(index),
                size: 24,
                color: Colors.blue,
              ),
              const SizedBox(height: 8),
              Text(
                texts[index], // Display text corresponding to the icon index
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
