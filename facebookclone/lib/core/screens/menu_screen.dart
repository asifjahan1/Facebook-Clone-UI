import 'package:facebookclone/core/constants/constants.dart';
import 'package:facebookclone/core/screens/error_screen.dart';
import 'package:facebookclone/core/screens/loader.dart';
import 'package:facebookclone/features/auth/providers/get_user_info_as_stream_by_id_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/menu';

  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? userId; // Define userId variable

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser!.uid; // Get current user ID
  }

  Widget _buildMenuItem(int index) {
    IconData iconData;
    switch (index) {
      case 0:
        iconData = Icons.save;
        break;
      case 1:
        iconData = Icons.feed;
        break;
      case 2:
        iconData = Icons.people;
        break;
      case 3:
        iconData = Icons.group;
        break;
      case 4:
        iconData = Icons.video_library;
        break;
      case 5:
        iconData = Icons.pages;
        break;
      default:
        iconData = Icons.error;
    }

    return GestureDetector(
      onTap: () {
        // Handle menu item tap if needed
      },
      child: Icon(iconData),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final userInfo = ref.watch(getUserInfoAsStreamByIdProvider(
            userId!)); // Pass userId to provider

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
                            fontWeight: FontWeight.bold, fontSize: 25),
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
                                        //color: Colors.grey.withOpacity(0.5),
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
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return _buildMenuItem(index);
                          },
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
}
