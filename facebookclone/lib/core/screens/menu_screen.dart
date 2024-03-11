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
        return Icons.feed;
      case 2:
        return Icons.people_alt_outlined;
      case 3:
        return Icons.groups_2;
      case 4:
        return Icons.video_library;
      case 5:
        return Icons.flag;
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
                body: Padding(
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
                      Expanded(
                        child: Column(
                          children: [
                            for (int i = 0; i < 6; i += 2)
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
                          ],
                        ),
                      ),
                    ],
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
    ];

    return Expanded(
      child: Container(
        height: 100,
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
          alignment: Alignment.topLeft,
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
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
